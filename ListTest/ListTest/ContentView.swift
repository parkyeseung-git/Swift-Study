//
//  ContentView.swift
//  ListTest
//
//  Created by 박콩승 on 10/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Image(systemName: "bolt")
                .font(.system(size: 100))
                .frame(width: 500, height: 600)
                .background(.red)
            Image(systemName: "heart")
                .font(.system(size: 100))
                .frame(width: 500, height: 600)
                .background(.blue)
            Image(systemName: "circle.fill")
                .font(.system(size: 100))
                .frame(width: 500, height: 600)
                .background(.orange)
               
            .frame(maxWidth: .infinity)
        
        }.background(Color.yellow)
    }
}

#Preview {
    ContentView()
}
