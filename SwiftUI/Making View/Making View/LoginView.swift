//
//  LoginView.swift
//  Making View
//
//  Created by 박콩승 on 10/27/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isUserLoggedIn = false
    
    var isValidEmail: Bool {
        isValid(regex: "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
    }
    
    func login() {
        isUserLoggedIn = isValidEmail
    }
    
    private func isValid(regex: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: email)
    }
}

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
//    @ObservedObject private var loginData = LoginData()
    
    var body: some View {
        VStack{
            Text("로그인을 해주세요😀 ").font(.largeTitle).bold()
        
            TextField("이메일을 입력해 주세요...", text: $loginVM.email)
                .roundedField()
            
            SecureField("비밀번호를 입력해 주세요...", text: $loginVM.password)
                .roundedField()
            
            Button("로그인") {
                loginVM.login()
            }
            .disabled(!loginVM.isValidEmail)
        }
        .fullScreenCover(isPresented: $loginVM.isUserLoggedIn) {
            Text(loginVM.email)
        }
    }
}

extension View {
    func roundedField() -> some View {
        self.padding()
            .background(){
                RoundedRectangle(cornerRadius: 20).stroke()
            }
            .padding([.horizontal,.bottom])
    }
}

#Preview {
    LoginView()
}
