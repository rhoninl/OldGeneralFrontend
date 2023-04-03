//
//  main.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var userInfo: userInfoShared
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
        .onAppear {
            if ispreview {
                return
            }
            userInfo.fetchUserInfo(userId)
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        if preview(){}
        Main()
            .environmentObject(userInfoShared())
    }
}
