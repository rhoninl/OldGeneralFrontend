//
//  SubmitSignInPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/14.
//

import SwiftUI

struct SubmitSignInPage: View {
    @State private var isShowingImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @State private var showFullScreenImage = false
    @State private var isShowingFullSizeImage = false
    @State private var signInMessag:String = ""
    @State private var errorMessage: String?
    @State private var alert: Bool = false
    @State var signInInfo: Cdr_SignInInfo = Cdr_SignInInfo()
    @Binding var needFetch: Bool
    var flagId: String = "123"
    var signInTime: Int64 = 100
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text("今日打卡信息")
                TextEditor(text: $signInMessag)
                    .padding(.all,5)
                    .lineLimit(4)
                    .frame(maxHeight: 100)
                    .border(.primary)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                HStack{
                    if selectedImage != nil {
                        VStack{
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                self.isShowingFullSizeImage = true
                            }
                        }
                        .overlay(alignment: .topTrailing) {
                            Text(" × ")
                                .font(.title2)
                                .background(Color("white"))
                                .onTapGesture {
                                    selectedImage = nil
                                }
                                .frame(height: 20)
                        }
                    } else {
                        Text("+")
                            .foregroundColor(.primary.opacity(0.8))
                            .font(Font.custom("", size: 50))
                            .padding(.all,60)
                            .background(.gray.opacity(0.3))
                            .overlay{
                                Rectangle()
                                    .stroke(Color.primary, style: StrokeStyle(lineWidth: 1, dash: [4]))
                            }
                            .onTapGesture {
                                isShowingImagePicker = true
                            }
                    }
                    Spacer()
                }
                .frame(width: 200,height: 200)
                Spacer()
                Button{
                    defer { alert = true}
                    signInInfo.id = generateUUID()
                    signInInfo.flagID = flagId
                    signInInfo.content = signInMessag
                    signInInfo.currentTime = signInTime
                    errorMessage = uploadImage()
                    guard errorMessage == nil else {
                        return
                    }
                    guard signInFlag(signInInfo) else {
                        print("error to sign in")
                        return
                    }
                } label: {
                    Text("打卡")
                        .padding(.all,1)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow.opacity(0.8))
            }
            .padding()
            
            if isShowingFullSizeImage {
                FullScreenImageOverlay(image: selectedImage ?? UIImage(systemName: "person.crop.circle.fill")!)
                    .onTapGesture {
                        isShowingFullSizeImage = false
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .transition(.opacity)
            }
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(image: $selectedImage)
        }
        .alert(isPresented: $alert) {
            Alert(title: Text("打卡\(errorMessage == nil ? "成功" : "失败" )"), message:  Text("\(errorMessage == nil ? "恭喜您打卡成功" : errorMessage!)")
                  , dismissButton: .default(Text("知道了"),action: {
                if errorMessage == nil {
                    needFetch = true
                    self.presentationMode.wrappedValue.dismiss()
                }
            }))
        }
    }
    func uploadImage() -> String? {
        guard selectedImage != nil else {
            return "请先选择上传图片"
        }
        
        guard signInMessag != "" else {
            return "请先填写今日打卡信息"
        }
        
        guard let imageData = selectedImage?.jpegData(compressionQuality: 0.1) else {
            print("Error converting image to data")
            return "图片信息错误，请重试"
        }
        
        let pictureName = "\(userId)/\(flagId)/\(signInInfo.id)"
        
        guard sendPutRequest(fileName: pictureName, data: imageData) else {
            return "图片上传失败，请重试"
        }
        
        return nil
    }
}

struct SubmitSignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SubmitSignInPage(needFetch: .constant(false))
    }
}
