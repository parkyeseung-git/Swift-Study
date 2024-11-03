//
//  ContentView.swift
//  SettingApp
//
//  Created by 박콩승 on 11/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAirplaneModeOn: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        profileCell()
                    }
                    
                } //프로필 섹션
                
                
                Section {
                    AirPlaneToggleCell()
                    
                    wifiTextCell(imageName: "wifi", titleName: "Wi-Fi", iconColor: .blue, subText: "SK_WiFiGIGAD9_5G",NavigationName: "WiFi 화면!" )
                    
                    wifiTextCell(imageName: "bolt", titleName: "블루투스", iconColor: .blue, subText: "켬", NavigationName: "블루투스 화면")
                    
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
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.all,10)
                .background(.green)
                .clipShape(.circle)
            VStack(alignment: .leading, spacing: 3) {
                Text("Pyes")
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                Text("Apple ID, iCloud, 미디어 및 구입")
                    .font(.system(size: 14))
            }
            .padding(.leading, 7)
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder // 토글 셀
    private func AirPlaneToggleCell() -> some View {
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
    private func wifiTextCell(imageName: String, titleName: String, iconColor: Color, subText: String,NavigationName: String) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all , 4)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
                
            NavigationLink {
                Text(NavigationName)
            } label: {
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
}

#Preview {
    ContentView()
}
