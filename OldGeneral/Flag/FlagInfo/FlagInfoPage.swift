//
//  FlagInfoPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct FlagInfoPage: View {
    init (_ info: Cdr_FlagDetailInfo) {
        flagInfo = info
        isOwner = info.userID == userId
    }
    private var flagInfo: Cdr_FlagDetailInfo
    private var isOwner: Bool = false
    @Environment(\.presentationMode) var presentationMode
    private var usericon: Image = Image(systemName: "square.and.arrow.up.fill")
    
    
    @State private var jumpToSignInFlagPage:Bool = false
    @State private var alertSiege: Bool = false
    @State private var showResult: Bool = false
    @State private var errMsg: String = ""
    
    var body: some View {
        ZStack {
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
                            NavigationLink {
                                SignInPage(signInId: index.id,parentPage: "flagInfo")
                            } label: {
                                FlagCardItem(info: index,totalNum: flagInfo.totalTime)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.all,30)
                    .frame(maxHeight: .infinity)
                }
                Button {
                    if isOwner {
                        jumpToSignInFlagPage = true
                    } else {
                        alertSiege = true
                    }
                } label: {
                    Text(isOwner ? "打卡" : "围观分钱")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.primary)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .tint(.yellow.opacity(0.8))
            }
            .navigationDestination(isPresented: $jumpToSignInFlagPage) {
                SubmitSignInPage(flagId: flagInfo.id,signInTime: Int64(flagInfo.signUpInfo.count + 1))
            }
            .alert(isPresented: $alertSiege) {
                Alert(title: Text("围观分钱"), message: Text(ConfirmSiegeDesctiption)
                      , primaryButton: .default(Text("支付10金币")){
                    TrytoSiege()
                    showResult = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.showResult = false
                    }
                },secondaryButton: .destructive(Text("放弃资格")))
            }
            if showResult {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color("AlertCardColor"))
                    .frame(width: 250, height: 250)
                    .overlay(
                        VStack(spacing: 20) {
                            Text(errMsg == "" ? "🎉": "×")
                                .font(.custom("", size: 100))
                            Text(errMsg == "" ? "围观成功": errMsg)
                                .font(.title3)
                        }
                    )
            }
        }
    }
    func TrytoSiege() {
        guard getCurrentMoney() >= 10 else {
            errMsg = "余额不足，请先充值"
            return
        }
        guard SiegeFlag(flagInfo.id) else {
            errMsg = "围观失败"
            return
        }
        
        errMsg = ""
    }
}

struct FlagInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        let signinInfo = Cdr_SignInInfo.with{ my in
            my.id = "12"
        }
        let info = Cdr_FlagDetailInfo.with{ my in
            my.id = "flagId"
            my.name = "flagName"
            my.challengeNum = 100
            my.siegeNum = 100
            my.status = "进行中"
            my.starNum = 33
            my.userName = "username"
            my.userID = "123"
            my.userAvatar = "https://as1.ftcdn.net/v2/jpg/03/03/97/00/1000_F_303970065_Yi0UpuVdTb4uJiEtRdF8blJLwcT4Qd4p.jpg"
            my.signUpInfo = [signinInfo]
        }
        FlagInfoPage(info)
    }
}
