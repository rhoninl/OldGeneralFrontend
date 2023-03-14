//
//  SignInPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import SwiftUI

struct SignInPage: View {
    @State private var jumpToFlagPage:Bool = false
    @State private var flagInfo: Cdr_FlagDetailInfo? = nil
    @Environment(\.presentationMode) var presentationMode

    var parentPage: String = "default"
    var body: some View {
        ScrollView {
            HStack{
                VStack(alignment: .leading){
                    Text("this is sign in content")
                    Image("turtlerock")
                        .resizable()
                        .frame(maxWidth: 100,maxHeight: 110)
                        .cornerRadius(5)
                    Text("10:10 打卡进度 1/100")
                        .font(.caption2)
                        .fontWeight(.ultraLight)
                    flagInfoBarItem()
                        .onTapGesture {
                            guard parentPage != "flagInfo" else {
                                self.presentationMode.wrappedValue.dismiss()
                                return
                            }
                            jumpToFlagPage = true
                            flagInfo = getFlagInfo("this")
                        }
                }
                .padding()
                Spacer()
            }
            Divider()
            LazyVGrid(columns: [GridItem(.flexible())],alignment: .leading) {
                commentitem()
            }
        }
        .navigationDestination(isPresented: $jumpToFlagPage) {
            if flagInfo != nil  {
                FlagInfoPage(flagInfo!,parentPage: "signInPage")
            }
        }
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}
