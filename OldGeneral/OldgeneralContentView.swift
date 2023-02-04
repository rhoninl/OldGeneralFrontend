//
//  OldgeneralContentView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct OldgeneralContentView: View {
    var body: some View {
        TabView {
            FlagSquare()
                .tabItem{
                    Image(systemName: "theatermask.and.paintbrush")
                    Text("戏台")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "person")
                    Text("我")
                }
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct OldgeneralContentView_Previews: PreviewProvider {
    static var previews: some View {
        OldgeneralContentView()
    }
}
