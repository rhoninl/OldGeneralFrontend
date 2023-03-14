//
//  UploadAvatarvPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UploadAvatarvPage: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("")
                    .frame(width: .infinity, height: .infinity)
            }
            Spacer()
            Button{
                isShowingImagePicker = true
            } label: {
                Text("点击上传")
            }
            .tint(.primary)
            .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
        }
    }

    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        // Upload the selected image to your server or update your app's state with the new avatar
    }
}




struct UploadAvatarvPage_Previews: PreviewProvider {
    static var previews: some View {
        UploadAvatarvPage()
    }
}
