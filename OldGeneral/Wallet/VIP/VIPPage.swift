//
//  VIPPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct VIPPage: View {
    let username: String
    var body: some View {
        VStack(spacing: 0){
            HStack{
                VIPChargePage(username: username)
                    .padding()
            }
            .background(.gray.opacity(0.6))
            VIPDescriptionPage()
        }
    }
}

struct VIPPage_Previews: PreviewProvider {
    static var previews: some View {
        VIPPage(username: "This is username")
    }
}
