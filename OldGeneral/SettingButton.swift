//
//  SettingButton.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct SettingButton: View {
    var body: some View {
        VStack{
            Image(systemName: "gearshape")
                .font(.system(size: 20))
            Text("设置")
                .padding(.top, 6.0)
        }
    }
}

struct SettingButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingButton()
    }
}
