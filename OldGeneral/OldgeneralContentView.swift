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

@MainActor class messageNotice: ObservableObject {
    @Published var message: String? = nil
    @Published var emoji: String? = nil
    @Published var isShowing: Bool = false
    
    func ShowMessage(message: String, emoji: String) {
        print("alert")
        isShowing = true
        self.message = message
        self.emoji = emoji
        print(message + emoji)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.message = nil
            self.emoji = nil
            self.isShowing = false
        }
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
    @StateObject var notice = messageNotice()
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
            .overlay{
                if notice.isShowing {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color("AlertCardColor"))
                    .frame(width: 250, height: 250)
                    .overlay(
                        VStack(spacing: 20) {
                            Text(notice.emoji ?? "")
                                .font(.custom("", size: 100))
                            Text(notice.message ?? "")
                                .font(.title3)
                        }
                    )
            }
        }
        .environmentObject(userInfo)
        .environmentObject(notice)
    }
}

struct OldgeneralContentView_Previews: PreviewProvider {
    static var previews: some View {
        OldgeneralContentView()
    }
}
