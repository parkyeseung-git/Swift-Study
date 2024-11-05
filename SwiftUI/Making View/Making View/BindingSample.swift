//
//  BindingSample.swift
//  Making View
//
//  Created by 박콩승 on 10/27/24.
//

import SwiftUI

struct BindingSample: View {
    @State private var backgroundColor1: Color = .brown
    @State private var text: String = ""
    
    var body: some View {
        let _ = Self._printChanges()
        ZStack{
            backgroundColor1.ignoresSafeArea()
            
            VStack{
                TextField("텍스트필드도 바인딩을 쓰네요", text: $text)
                    .tint(.black)
                ChangeColorButton(backgroundColor2: $backgroundColor1)
            }
        }
    }
}

struct ChangeColorButton: View {
    @Binding var backgroundColor2: Color
    
    var body: some View {
        let _ = Self._printChanges()
        Button {
            backgroundColor2 = .orange
        } label: {
            Text("배경 바꾸기")
                .font(.largeTitle)
                .tint(.white)
                .padding()
                .background{
                    backgroundColor2
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
        }
    }
}

#Preview {
    BindingSample()
}
