//
//  WiFiView.swift
//  SettingApp
//
//  Created by 박콩승 on 11/5/24.
//

import SwiftUI

struct WiFiView: View {
    @State var WiFiOn: Bool = true
    @State var WiFiLock: Bool = false

    
    var body: some View {
        NavigationView {
            List {
                if WiFiOn {
                    Section {
                        Toggle("Wi-Fi", isOn: $WiFiOn)
                            .padding(.leading)
                    } footer: {
                        Text("제어 센터에서 새로운 Wi-Fi 네트워크에 연결하는 기능이 꺼져 있습니다.")
                    }// wifi toggle
                    
                    Section {
                        WifiCell(WifiText: "3411_1", WifiLock: true)
                        WifiCell(WifiText: "3411_2", WifiLock: true)
                        WifiCell(WifiText: "FREE_U+zone", WifiLock: false)
                        WifiCell(WifiText: "LGU+_POLY", WifiLock: true)
                    } header: {
                        Text("나의 네트워크")
                    } // 나의 네트워크 섹션
                    
                    Section {
                        WifiCell(WifiText: "U+zone", WifiLock: false)
                        Text("기타...")
                            .padding(.leading)
                    } header: {
                        Text("다른 네트워크")
                    } // 다른 네트워크 섹션
                    
                    Section {
                        NavigationLink {
                            Text("네트워크 화면")
                        } label: {
                            HStack {
                                Text("네트워크 연결 요청")
                                    .padding(.leading)
                                Spacer()
                                Text("알림")
                                    .foregroundColor(.gray)
                            }
                        }
                    } footer: {
                        Text("알고 있는 네트워크에 자동으로 연결됩니다. 사용 가능한 알고있는 네트워크가 없다면, 사용할 수 있는 네트워크를 알려줍니다.")
                            .frame(width: 350)
                    }// 네트워크 연결 요청 섹션
                    
                    Section {
                        NavigationLink {
                            Text("핫스팟 자동 연결 화면")
                        } label: {
                            HStack {
                                Text("핫스팟 자동 연결")
                                    .padding(.leading)
                                Spacer()
                                Text("연결 요청")
                                    .foregroundColor(.gray)
                            }
                        }
                    } footer: {
                        Text("사용 가능한 Wi-Fi 네트워크가 없을 때 이 기기가 자동으로 근처 개인용 핫스팟을 찾도록 허용합니다.")
                            .frame(width: 350)
                    } // 핫스팟 자동 연결 섹션
                    
                    
                } else {
                    Section {
                        Toggle("Wi-Fi", isOn: $WiFiOn)
                            .padding(.leading)
                    } footer: {
                        Text("AirDrop, AirPlay, '사용자로부터 떨어지게 되면 알리기' 및 더 정확한 위치 서비스를 사용하려면 Wi-Fi가 필요합니다.")
                    }// wifi toggle
                }
                
                
            }
        }
    }
}

@ViewBuilder
private func WifiCell(WifiText: String, WifiLock: Bool) -> some View {
    HStack {
        Text(WifiText)
            .padding(.leading)
        Spacer()
        if WifiLock {
            Image(systemName: "lock.fill")
        }
        Image(systemName: "wifi")
        Image(systemName: "info.circle")
            .foregroundStyle(.blue)
    }
    
}

struct WifiInfo : View {
    var body: some View {
        Text("WifiInfo 화면")
    }
}

#Preview {
    WiFiView()
}
