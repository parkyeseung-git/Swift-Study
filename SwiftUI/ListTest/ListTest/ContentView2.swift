//
//  ContentView2.swift
//  ListTest
//
//  Created by 박콩승 on 10/29/24.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<20) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0..<10)  { _ in
                                RoundedRectangle(cornerRadius: 20)
                                    .overlay(Text("SwiftUI").foregroundColor(.white))
//                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                                    
                            }
                        }
                    })
                }
            }
        }

    }
}

#Preview {
    ContentView2()
}
