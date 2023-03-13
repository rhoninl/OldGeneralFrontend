//
//  commentitem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/13.
//

import SwiftUI

struct commentitem: View {
    var body: some View {
        HStack {
            circleImage(url: "")
                .frame(width: 40,height: 40)
            VStack(alignment: .leading,spacing: 10){
                Text("userName")
                Text("comment content")
            }
            .lineLimit(1)
            .font(.footnote)
            Spacer()
            Text("time")
                .font(.callout)
                .fontWeight(.ultraLight)
        }
        .padding()
    }
}

struct commentitem_Previews: PreviewProvider {
    static var previews: some View {
        commentitem()
    }
}
