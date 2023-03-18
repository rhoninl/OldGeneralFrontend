//
//  UploadAvatarvPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UploadAvatarPage: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @EnvironmentObject var userInfo: userInfoShared
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("上传头像")
            VStack{
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 150,height: 150)
                } else {
                    AsyncImage(url: URL(string: userInfo.data.avatar)) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                                .clipShape(Circle())
                                .frame(width: 150,height: 150)
                        default :
                            Image("avatar")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 150,height: 150)
                        }
                    }
                }
                Text("点击上传头像")
            }
            .onTapGesture {
                isShowingImagePicker = true
            }
            .padding(.top,100)
            Spacer()
            Button{
                guard let imageData = selectedImage?.jpegData(compressionQuality: 0.1) else {
                    print("Error converting image to data")
                    return
                }
                
                let pictureName = "\(userId)"
                
                guard sendPutRequest(fileName: pictureName, data: imageData) else {
                    print("upload failed")
                    return
                }
                
                if userInfo.data.avatar == pictureServerAddress + pictureName + ".jpg" {
                    print("avatar url doesn't need to update ")
                } else {
                    userInfo.data.avatar = pictureServerAddress + pictureName + ".jpg"
        
                    guard UpdateUserInfo(userInfo: userInfo.data) else {
                        print("error to update user Info")
                        return
                    }
                }
                
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("保存")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow.opacity(0.8))
            .padding()
            .foregroundColor(.black)
            .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
        }
    }

    func loadImage() {
        selectedImage = selectedImage
    }
}




struct UploadAvatarPage_Previews: PreviewProvider {
    static var previews: some View {
        UploadAvatarPage()
            .environmentObject(userInfoShared())
    }
}
