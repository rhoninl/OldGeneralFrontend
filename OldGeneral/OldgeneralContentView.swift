//
//  OldgeneralContentView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct OldgeneralContentView: View {
    var body: some View {
        Login()
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)
    }
}

struct OldgeneralContentView_Previews: PreviewProvider {
    static var previews: some View {
        OldgeneralContentView()
    }
}