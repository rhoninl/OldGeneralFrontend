//
//  systemMessageItemPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/8.
//

import SwiftUI

struct systemMessageItem: View {
    var iconName: String
    var description: String
    var backgroundColor: Color
    var body: some View {
        VStack{
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 30,maxHeight: 30)
                .padding(.all,10)
                .background(backgroundColor)
                .cornerRadius(40)
                .foregroundColor(.white)
            Text(description)
                .font(.body)
        }
    }
}

struct systemMessageItem_Previews: PreviewProvider {
    static var previews: some View {
        systemMessageItem(iconName: "person.3.sequence.fill",description: "围观",backgroundColor: Color.red)
    }
}
