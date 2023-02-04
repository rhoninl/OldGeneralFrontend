//
//  VIPButton.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct VIPButton: View {
    var body: some View {
        VStack{
            Image(systemName: "star")
                .font(.system(size: 20))
            Text("VIP")
                .padding(.top, 6.0)
        }
    }
}

struct VIPButton_Previews: PreviewProvider {
    static var previews: some View {
        VIPButton()
    }
}
