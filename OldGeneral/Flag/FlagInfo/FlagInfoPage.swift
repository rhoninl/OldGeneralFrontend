//
//  FlagInfoPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct FlagInfoPage: View {
    init (_ info: Cdr_FlagDetailInfo, parentPage: String = "default") {
        flagInfo = info
        isOwner = userId == info.userID
        self.parentPage = parentPage
    }
    var flagInfo: Cdr_FlagDetailInfo
    var parentPage: String
    @Environment(\.presentationMode) var presentationMode
    @State private var jumpToSignInFlagPage:Bool = false
    
    private var usericon: Image = Image(systemName: "square.and.arrow.up.fill")
    private var isOwner: Bool = false
    @State private var jumpToSignPage: Bool = false
    @State private var signInId: String = ""
    
    var body: some View {
        VStack{
            ScrollView{
                HStack{
                    circleImage(url: flagInfo.userAvatar)
                        .frame(width: 50,height: 50)
                    Text(flagInfo.userName)
                }
                VStack{
                    HStack{
                        VStack(alignment: .leading,spacing: 10){
                            Text(flagInfo.name)
                            Text("\(flagInfo.starNum)点赞 \(flagInfo.siegeNum)围观")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.caption2)
                        }
                        Spacer()
                    }
                    .padding([.leading,.bottom,.trailing],10)
                    HStack(spacing: 60){
                        FlagDetailInfoItem(description: "投币助力", data: String(flagInfo.siegeNum))
                        FlagDetailInfoItem(description: "挑战金币", data: String(flagInfo.challengeNum))
                        FlagDetailInfoItem(description: "挑战状态", data: flagInfo.status)
                    }
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
                }
                .padding(.bottom,4)
                Divider()
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(flagInfo.signUpInfo, id: \.self) { index in
                        FlagCardItem(info: index,totalNum: flagInfo.totalTime)
                            .onTapGesture {
                                guard parentPage != "signInPage" else {
                                    self.presentationMode.wrappedValue.dismiss()
                                    return
                                }
                                jumpToSignPage = true
                            }
                    }
                }
                .padding(.all,30)
                .frame(maxHeight: .infinity)
            }
            Button {
               jumpToSignInFlagPage = true
            } label: {
                Text(isOwner ? "打卡" : "围观分钱")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .tint(.yellow.opacity(0.8))
        }
        .navigationDestination(isPresented: $jumpToSignPage) {
            SignInPage(signInId: nil)
        }
        .navigationDestination(isPresented: $jumpToSignInFlagPage) {
            SubmitSignInPage(flagId: flagInfo.id,signInTime: Int64(flagInfo.signUpInfo.count + 1))
        }
    }
}

struct FlagInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagDetailInfo.with{ my in
            my.id = "flagId"
            my.name = "flagName"
            my.challengeNum = 100
            my.siegeNum = 100
            my.status = "进行中"
            my.starNum = 33
            my.userName = "username"
            my.userAvatar = "https://as1.ftcdn.net/v2/jpg/03/03/97/00/1000_F_303970065_Yi0UpuVdTb4uJiEtRdF8blJLwcT4Qd4p.jpg"
            my.signUpInfo = [Cdr_SignInInfo(),Cdr_SignInInfo()]
        }
        FlagInfoPage(info)
    }
}
