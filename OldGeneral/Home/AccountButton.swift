//
//  HomeButtons.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct AccountButton: View {
    var body: some View {
        VStack{
            Image(systemName: "creditcard")
                .font(.system(size: 20))
                .padding(.top, 4)
            Text("账户")
                .padding(.top, 8.0)
        }
    }
}

struct AccountButtons_Previews: PreviewProvider {
    static var previews: some View {
        AccountButton()
    }
}
