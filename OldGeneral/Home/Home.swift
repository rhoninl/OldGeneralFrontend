//
//  SwiftUIView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct HomeView: View {
    private var Flags: Int = 123
    private var Achieves: Int = 456
    private var Sieges: Int = 789
    
    @State private var flagInfo: [Cdr_FlagBasicInfo] = []
    @State private var jumptoSettingPage: Bool = false
    @State private var animationState: CGFloat = 1
    
    var body: some View {
        VStack {
            NavigationLink {
                UserInfoEditPage()
            } label: {
                UserInfo()
                    .padding([.leading,.trailing,.bottom],20)
            }

                
            Divider()
                .padding(.horizontal, 30.0)
                .frame(minHeight: 7)
            HStack(spacing: 40.0){
                Spacer()
                VStack(){
                    Text("发起")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    Text("\(Flags)")
                        .font(.system(size: 16))
                }
                Divider()
                    .frame(height: 30)
                
                VStack {
                    Text("成功")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    Text("\(Achieves)")
                        .font(.system(size: 16))
                }
                Divider()
                    .frame(height: 30)
                VStack{
                    Text("围观")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    Text("\(Sieges)")
                        .font(.system(size: 16))
                }
                Spacer()
            }
            Divider()
                .padding(.horizontal, 30.0)
                .frame(minHeight: 7)
            HStack(alignment: .bottom, spacing: 45.0){
                NavigationLink {
                    WalletPage()
                } label: {
                    AccountButton()
                }
                NavigationLink {
                    VIPPage()
                } label: {
                    VIPButton()
                }
                NavigationLink {
                    QAPage()
                } label: {
                    QAButton()
                }
               SettingButton()
                    .onTapGesture {
                        jumptoSettingPage = true
                    }
                
            }
            .padding([.top,.bottom],20)
            MyFlags(data: flagInfo)
            Spacer()
        }
        .padding(.top, 40.0)
        .buttonStyle(.plain)
        .navigationDestination(isPresented: $jumptoSettingPage) {
            SettingsPage()
        }
        .onAppear{
            guard !ispreview else {
                print(ispreview)
                return
            }
            guard needRefreshMyFlag else {
                print("no need to refresh myFlag")
                return
            }
            flagInfo = fetchMyFlagList()
            needRefreshMyFlag = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        if preview() {
            HomeView()
                .environmentObject(userInfoShared())
        }
    }
}
