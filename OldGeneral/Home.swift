//
//  SwiftUIView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI
import Spring

struct HomeView: View {
    @State private var animationState: CGFloat = 1
    var body: some View {
        VStack {
            UserInfo()
                .padding(.trailing, 70.0)
                
            Divider()
                .padding(.horizontal, 30.0)
                .frame(minHeight: 7)
            HStack(spacing: 40.0){
                Spacer()
                VStack(){
                    Text("发起")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    Text("1000")
                        .font(.system(size: 16))
                }
                Divider()
                    .frame(height: 30)
                
                VStack {
                    Text("成功")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    Text("1000")
                        .font(.system(size: 16))
                }
                Divider()
                    .frame(height: 30)
                VStack{
                    Text("围观")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    Text("1000")
                        .font(.system(size: 16))
                }
                Spacer()
            }
            Divider()
                .padding(.horizontal, 30.0)
                .frame(minHeight: 7)
            HStack(alignment: .bottom, spacing: 45.0){
                AccountButton()
                VIPButton()
                QAButton()
                SettingButton()
            }
            .padding(.top,40)
            Spacer()
        }
        .padding(.top, 40.0)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()

    }
}
