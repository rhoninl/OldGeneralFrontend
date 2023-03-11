//
//  main.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct Main: View {
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
        .navigationBarBackButtonHidden()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
