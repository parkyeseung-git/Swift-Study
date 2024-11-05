//
//  ContentView.swift
//  LoginViewTest
//
//  Created by 박콩승 on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var id = ""
    @State var pw = ""
    @State var ShowPassword: Bool = false

    var body: some View {
    
        Image(systemName: "dog.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .padding(.bottom)
        VStack {
            HStack {
                Text("    아이디 : ")
                TextField("Enter your ID", text: $id)
                    .textFieldStyle(.roundedBorder)
            } .padding()
            HStack {
                Text("비밀번호 : ")
                if ShowPassword == true {
                    TextField("Enter your password", text: $pw)
                        .textFieldStyle(.roundedBorder)
                } else {
                    SecureField("Enter your password", text: $pw)
                        .textFieldStyle(.roundedBorder)
                }
                
                Button {
                    ShowPassword.toggle()
                } label: {
                    Image(systemName: "eye")
                        .tint(.black)
                }
            }.padding()
            
            Button {
                print("id: \(id), pw: \(pw)")
            } label: {
                Text("로그인")
                    .padding()
                    .font(.headline)
                    .bold()
            }
            
        

        }
        
    }
}

#Preview {
    ContentView()
}
