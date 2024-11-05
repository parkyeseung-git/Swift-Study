//
//  ContentView.swift
//  SettingApp
//
//  Created by 박콩승 on 11/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAirplaneModeOn: Bool = false
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            List {
                SerchCell()
                
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        profileCell()
                    }
                } //프로필 섹션
                
                
                
                Section {
                    ToggleCell()
                    
                    TextCell(
                            imageName: "wifi",
                            titleName: "Wi-Fi",
                            iconColor: .blue,
                            subText: "SK_WiFiGIGAD9_5G",
                            destination: {
                                WiFiView()
                            }
                        )
                    
                    TextCell(imageName: "bolt", titleName: "블루투스", iconColor: .blue, subText: "켬", destination: {
                        Text("블루투스 화면")
                    })
                    
                    PlainCell(imageName: "antenna.radiowaves.left.and.right", iconColor: .green, cellTitle: "셀룰러") {
                        Text("셀룰러 화면")
                    }
                } // 1번 섹션
                
                Section {
                    PlainCell(imageName: "hourglass", iconColor: .indigo,
                              cellTitle: "스크린 타임") {
                        Text("스크린 타임 화면")
                    }
                } // 2번 섹션
                
                Section {
                    PlainCell(imageName: "move.3d", iconColor: .gray,
                              cellTitle: "일반") {
                        Text("일반 화면")
                    }
                    
                    PlainCell(imageName: "accessibility", iconColor: .blue,
                              cellTitle: "손쉬운 사용") {
                        Text("손쉬운 사용 화면")
                    }
                    
                    PlainCell(imageName: "hand.raised.palm.facing", iconColor: .blue,
                              cellTitle: "개인 정보 보호") {
                        Text("개인 정보 보호 화면")
                    }
                    
                } // 3번 섹션
                
                Section {
                    PlainCell(imageName: "key", iconColor: .gray,
                              cellTitle: "암호") {
                        Text("암호 화면")
                    }
                } // 4번 섹션
            }.navigationTitle("설정")
            
        }
    }
    
    @ViewBuilder // 프로필셀
    private func profileCell() -> some View {
        HStack {
            Circle()
                .foregroundStyle(.gray)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70,height: 70)
                .overlay {
                    Text("예승")
                        .foregroundStyle(.white)
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                }
            
            VStack(alignment: .leading, spacing: 3) {
                Text("박예승")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                Text("Apple 계정, iCloud 등")
                    .font(.system(size: 14))
            }
            .padding(.leading, 7)
        }
//        .padding(.vertical, 2)
    }
    
    @ViewBuilder // 토글 셀
    private func ToggleCell() -> some View {
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all , 4)
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(6)
            
            Toggle("에어플레인 모드", isOn: $isAirplaneModeOn)
        }
    }
    
    @ViewBuilder // 텍스트셀
    private func TextCell<Destination: View>(
        imageName: String,
        titleName: String,
        iconColor: Color,
        subText: String,
        destination: () -> Destination // 목적지 뷰를 받는 클로저
    ) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(iconColor) // 아이콘 색상 변경
                .foregroundColor(.white)
                .cornerRadius(6)

            NavigationLink(destination: destination()) { // 클로저를 사용하여 목적지 뷰 설정
                HStack {
                    Text(titleName)
                    Spacer()
                    Text(subText)
                        .foregroundColor(.gray)
                }
            }
        }
    }

    
    @ViewBuilder // 일반 셀
    private func PlainCell<V: View>(imageName: String,iconColor: Color ,cellTitle: String, destination: @escaping() -> V) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all , 4)
                .background(iconColor)
                .foregroundColor(.white)
                .cornerRadius(6)
                
            NavigationLink(cellTitle) {
                destination() // Text("News 화면")
            }
        }
    }
    
    @ViewBuilder // 검색 셀
    private func SerchCell() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("검색", text: $text)
            .font(.system(size: 20))
            Image(systemName: "mic.fill")
                .font(.system(size: 20))
        }
        .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)) // 원하는 패딩 값 설정
    }
}

#Preview {
    ContentView()
}
