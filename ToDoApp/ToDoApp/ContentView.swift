//
//  ContentView.swift
//  ToDoApp
//
//  Created by 박콩승 on 11/2/24.
//

// ContentView.swift - 뷰 파일
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newItemTitle: String = ""
    @Environment(\.editMode) private var editMode // 편집 모드 상태를 관리하는 환경 변수를 추가합니다.

    var body: some View {
        NavigationView {
            VStack {
                // 할 일 추가를 위한 입력 필드와 추가 버튼
                HStack {
                    TextField("입력!", text: $newItemTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        if !newItemTitle.isEmpty {
                            viewModel.addItem(title: newItemTitle)
                            newItemTitle = ""
                        }
                    }) {
                        Text("추가")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.black)
                            .frame(width: 50, height: 30)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                
                // 날짜별로 그룹화하여 리스트 섹션 생성
                List {
                    ForEach(getSortedKeys(), id: \.self) { date in
                        Section(header: Text(date)) {
                            renderSectionItems(for: date)
                        }
                    }
                    .onDelete(perform: deleteItems) // 스와이프하여 삭제 기능 추가
                }
                .navigationTitle("ToDo 메모📝")
                .toolbar {
                    EditButton() // 편집 버튼 추가
                }
            }
        }
    }
    
    // 날짜별 그룹화된 데이터의 키를 정렬하여 반환하는 함수
    private func getSortedKeys() -> [String] {
        return viewModel.groupedItems().keys.sorted()
    }

    // 각 날짜 섹션의 항목을 렌더링하는 함수
    private func renderSectionItems(for date: String) -> some View {
        let itemsForDate = viewModel.groupedItems()[date] ?? []
        
        return ForEach(itemsForDate) { item in
            HStack {
                if item.isCompleted {
                    Text(item.title)
                    Text("Good👍")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.green)
                } else {
                    Text(item.title)
                }
                Spacer()
                Button(action: {
                    viewModel.toggleCompleted(for: item)
                }) {
                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                }
            }
        }
    }

    // 삭제 기능을 구현하는 메서드
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let dateKey = getSortedKeys()[index] // 삭제할 날짜를 가져옵니다.
            let itemsForDate = viewModel.groupedItems()[dateKey] ?? []
            if let item = itemsForDate.first {
                viewModel.deleteItem(at: IndexSet(integer: viewModel.items.firstIndex(where: { $0.id == item.id })!)) // 특정 항목 삭제
            }
        }
    }
}


#Preview {
    ContentView()
}

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
