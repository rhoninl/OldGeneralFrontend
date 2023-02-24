//
//  FlagSquareItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/22.
//

import SwiftUI

struct FlagSquareItem: View {
    var userName: String = "default"
    var imageName: String
    var body: some View {
        GroupBox{
            VStack(alignment: .leading){
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                Text("This is the flag Name")
                    .font(.subheadline)
                    .lineLimit(1)
                HStack{
                    Text(userName)
                        .lineLimit(1)
                    Spacer()
                    Text("100金")
                        .lineLimit(1)
                        .foregroundColor(Color("Money"))
                }
                .font(.caption2)
            }
        }
//        .frame(width: UIScreen.main.bounds.width * 0.4)
    }
}

struct FlagSquareItem_Previews: PreviewProvider {
    static var previews: some View {
        FlagSquareItem(imageName: "image1")
    }
}
