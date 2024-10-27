//
//  ContentView.swift
//  Making View
//
//  Created by 박콩승 on 10/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HelloText()
    }
}


struct HelloText: View{
    var body: some View {
        Text("안녕하세요")
            .foregroundStyle(.white)
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding([.vertical, .horizontal])
    }
}

#Preview {
    ContentView()
}
