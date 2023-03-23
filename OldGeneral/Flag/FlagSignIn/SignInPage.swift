//
//  SignInPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import SwiftUI

struct SignInPage: View {
    @State var signInId: String? = nil
    @State private var jumpToFlagPage:Bool = false
    @State var info: Cdr_SignInInfo = Cdr_SignInInfo()
    @State var flagInfo: Cdr_FlagDetailInfo = Cdr_FlagDetailInfo()
    @State private var isShowingFullSizeImage: Bool = false
    var parentPage: String = "default"
    @State private var image: UIImage = UIImage(named: "turtlerock")!
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            ScrollView {
                HStack{
                    VStack(alignment: .leading){
                        Text(info.content)
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100,height: 140)
                            .cornerRadius(5)
                            .onTapGesture {
                                isShowingFullSizeImage = true
                            }
                        
                        Text("\(timestampToTime(info.createdAt)) 打卡进度 \(info.currentTime)/\(flagInfo.totalTime)")
                            .font(.custom("", size: 10))
                            .fontWeight(.ultraLight)
                        flagInfoBarItem(info: flagInfo)
                            .onTapGesture {
                                guard parentPage != "flagInfo" else {
                                    self.presentationMode.wrappedValue.dismiss()
                                    return
                                }
                                jumpToFlagPage = true
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
                FlagInfoPage(flagInfo,parentPage: "signInPage")
            }
            .onAppear {
                if signInId != nil {
                    info = getSignInInfo(signInId!) ?? Cdr_SignInInfo()
                    guard self.info != Cdr_SignInInfo() else {
                        self.info.content = "get signIn Info failed"
                        return
                    }
                    self.flagInfo = getFlagInfo(info.flagID) ?? Cdr_FlagDetailInfo()
                    image = getImageFromURL(info.pictureURL) ?? UIImage(named: "turtlerock")! 
                }
            }
            if isShowingFullSizeImage {
                FullScreenImageOverlay(image: image)
                    .onTapGesture {
                        isShowingFullSizeImage = false
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .transition(.opacity)
            }
        }
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage(signInId: nil)
    }
}
