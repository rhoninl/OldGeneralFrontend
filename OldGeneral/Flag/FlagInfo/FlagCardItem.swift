//
//  FlagCardItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import SwiftUI

struct FlagCardItem: View {
    private var signInImage: Image = Image("turtlerock")
    private var signInData: String = "Sign in info"
    private var totalNum: String = "100"
    private var currentNum: String = "1"
    var body: some View {
        VStack(alignment: .leading){
            signInImage
                .resizable()
                .frame(width: 150,height: 150)
                .overlay(alignment: .bottomLeading) {
                    Text("进度 \(currentNum)/\(totalNum)")
                        .padding(.all,4)
                        .foregroundColor(.white)
                        .background(.primary.opacity(0.6))
                        .cornerRadius(5)
                        .padding(.all,4)
                        .font(.caption2)
                }
            Text(signInData)
                .font(.caption)
                .lineLimit(1)
        }
        .cornerRadius(10)
    }
}

struct FlagCardItem_Previews: PreviewProvider {
    static var previews: some View {
        FlagCardItem()
    }
}
