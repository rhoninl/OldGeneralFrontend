//
//  VIPPrivilegesItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct VIPPrivilegesItem: View {
    var icon: Image
    var text: String
    var subText: String
    var body: some View {
        VStack{
            icon
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.4) // double the size of the icon
                .padding(.all,3)
            Text(text)
                .font(.subheadline)
            Text(subText)
                .font(Font.custom("", size: 10))
                .opacity(0.5)
                .lineLimit(1)
        }
        .fontWeight(.light)
    }
}

struct VIPPrivilegesItem_Previews: PreviewProvider {
    static var previews: some View {
        VIPPrivilegesItem(icon: Image(systemName: "creditcard.fill"), text: "text", subText: "subText")
    }
}
