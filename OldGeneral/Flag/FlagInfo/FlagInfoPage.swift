//
//  FlagInfoPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct FlagInfoPage: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    private var usericon: Image = Image(systemName: "square.and.arrow.up.fill")
    private var username: String = "this is user Name"
    private var flagName: String = "this is flag Name"
    private var star: String = "10"
    private var watch: String = "10"
    private var coinOperate: String = "100"
    private var challengeGold: String = "100"
    private var flagStatus: String = "进行中"
    private var isOwner: Bool = false
    @State private var jumpToSignPage: Bool = false
    var body: some View {
        VStack{
            HStack{
                usericon
                    .frame(maxWidth: 30,maxHeight: 30)
                Text(username)
            }
            ScrollView{
                VStack{
                    HStack{
                        VStack(alignment: .leading,spacing: 10){
                            Text(flagName)
                            Text("\(star)点赞 \(watch)围观")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.caption2)
                        }
                        Spacer()
                    }
                    .padding(.all,10)
                    HStack(spacing: 60){
                        FlagDetailInfoItem(description: "投币助力", data: coinOperate)
                        FlagDetailInfoItem(description: "挑战金币", data: challengeGold)
                        FlagDetailInfoItem(description: "挑战状态", data: flagStatus)
                    }
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
                }
                .padding(.bottom,4)
                Divider()
                LazyVGrid(columns: columns) {
                    FlagCardItem()
                        .onTapGesture {
                            jumpToSignPage = true
                        }
                    FlagCardItem()
                    FlagCardItem()
                }
                .padding(.all,30)
                .background(.white)
                .frame(maxHeight: .infinity)
            }
            Button {
                
            } label: {
                Text(isOwner ? "打卡" : "围观分钱")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .background(.white)
            .tint(.yellow.opacity(0.8))
        }
        .navigationDestination(isPresented: $jumpToSignPage) {
            SignInPage()
        }
    }
}

struct FlagInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        FlagInfoPage()
    }
}
