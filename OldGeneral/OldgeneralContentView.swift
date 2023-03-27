//
//  OldgeneralContentView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

@MainActor class userInfoShared: ObservableObject {
    @Published var data = defaultUserInfo
    @Published var needRefresh = false
    
    func fetchUserInfo(_ userId: String, cache: Bool = true) {
        guard data == defaultUserInfo || cache == false else {
            return 
        }
        let data = getUserBasicInfo(userId)
        guard data != nil else {
            return
        }
        
        self.data = data == nil ? defaultUserInfo : data!
    }
}

struct OldgeneralContentView: View {
    init() {
        guard userId != "" else {
            return
        }

        let data = getUserBasicInfo(userId)
        guard data != nil else {
            return
        }
        
        userInfo.data = data!
        needRefreshMyFlag = true
    }
    @StateObject var userInfo = userInfoShared()

    var body: some View {
        NavigationStack{
            if CheckLoginStatus(){
                if GetVipEndTime() {}
                Main()
            }else {
                LoginPage()
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .environmentObject(userInfo)
    }
}

struct OldgeneralContentView_Previews: PreviewProvider {
    static var previews: some View {
        OldgeneralContentView()
    }
}
