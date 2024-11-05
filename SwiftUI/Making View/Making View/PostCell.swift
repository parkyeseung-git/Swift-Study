//
//  PostCell.swift
//  Making View
//
//  Created by 박콩승 on 10/27/24.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        HStack(alignment: .top){
            Circle()
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading){
                HStack{
                    Text("스티브")
                        .font(.body)
                        .bold()
                    
                    Text("3시간")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Text("요즘 iOS 개발에 대해서 생각이 많다.\nUIKit이 괜찮을지, SwiftUI가 괜찬을지...")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
        .background{
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 3)
        }
    }
}

#Preview {
    PostCell()
}
