//
//  Message.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/24.
//

import SwiftUI

struct Message: View {
    var body: some View {
        VStack{
            Text("消息")
                .font(.title3)
            HStack(spacing: 60){
                systemMessageItem(iconName: "person.3.sequence.fill", description: "围观", backgroundColor: Color.red.opacity(0.7))
                systemMessageItem(iconName: "star.fill", description: "点赞", backgroundColor: Color.purple.opacity(0.7))
                systemMessageItem(iconName: "ellipsis.message.fill", description: "评论", backgroundColor: Color.green.opacity(0.7))
            }
            .padding()
            Divider()
            List{
                frendMessageItem()
                    .padding(.all,7)
                frendMessageItem()
                    .padding(.all,7)
                frendMessageItem()
                    .padding(.all,7)
            }
            .listStyle(.plain)
        }
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
