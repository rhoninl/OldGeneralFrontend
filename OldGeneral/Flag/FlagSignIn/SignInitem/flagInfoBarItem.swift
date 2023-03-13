//
//  flagInfoBarPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/13.
//

import SwiftUI

struct flagInfoBarItem: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 10){
                Text("This is flagName")
                Text("挑战金: 1000金")
                    .fontWeight(.thin)
                    .font(.caption2)
            }
            Spacer()
            Button{
                
            } label:{
               Text("围观")
                    .padding([.leading,.trailing],10)
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow.opacity(0.7))
            .foregroundColor(.primary.opacity(0.7))
        }
        .font(.caption)
        .lineLimit(1)
        .padding(.all,6)
        .background(.yellow.opacity(0.2))
        .cornerRadius(8)
    }
}

struct flagInfoBarItem_Previews: PreviewProvider {
    static var previews: some View {
        flagInfoBarItem()
    }
}
