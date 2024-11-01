//
//  TodoViewModel.swift
//  ToDoApp
//
//  Created by 박콩승 on 11/2/24.
//

// TodoViewModel.swift - 뷰모델 파일
import Foundation

class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = []

    // 새 할 일 항목을 추가하는 메서드입니다.
    func addItem(title: String) {
        let newItem = TodoItem(title: title, date: Date()) // 생성 시 현재 날짜를 저장합니다.
        items.append(newItem)
    }

    func toggleCompleted(for item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }

    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    // 날짜별로 항목을 그룹화하여 반환하는 함수
    func groupedItems() -> [String: [TodoItem]] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // 날짜 형식을 "년-월-일"로 지정합니다.
        
        // 날짜별로 그룹화
        let grouped = Dictionary(grouping: items) { item in
            formatter.string(from: item.date)
        }
        
        return grouped
    }
}
