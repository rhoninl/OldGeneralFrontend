//
//  FlagSquareItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/22.
//

import SwiftUI

struct FlagSquareItem: View {
    var info: Cdr_FlagSquareItemInfo = Cdr_FlagSquareItemInfo()
    var body: some View {
        GroupBox{
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: info.signinPicture)){ phase in
                    switch phase {
                    case .empty:
                        ProgressView("Loading...")
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    default :
                        Image("avatar")
                            .resizable()
                    }
                }
                Text(info.flagName)
                    .font(.subheadline)
                    .lineLimit(1)
                HStack{
                    Text(info.userName)
                        .lineLimit(1)
                    Spacer()
                    Text("100金")
                        .lineLimit(1)
                        .foregroundColor(Color("Money"))
                }
                .font(.caption2)
            }
            .frame(maxWidth: 150,maxHeight: 150)
        }
    }
}

struct FlagSquareItem_Previews: PreviewProvider {
    static var previews: some View {
        FlagSquareItem()
    }
}
