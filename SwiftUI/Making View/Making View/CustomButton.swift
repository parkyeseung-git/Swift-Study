//
//  CustomButton.swift
//  Making View
//
//  Created by 박콩승 on 10/27/24.
//

import SwiftUI

struct CustomButton: View {
    let placeholder: String
    
    var body: some View {
        Button {
            print("버튼이 눌러졌습니다")
        } label: {
            Text("버튼을 눌러주세요")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
        }
    }
}

struct Flower: View {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
    }
}

#Preview {
    CustomButton(placeholder: "버튼 이름이 바뀌었네요")
//    Flower(name: "해바라기")
}
