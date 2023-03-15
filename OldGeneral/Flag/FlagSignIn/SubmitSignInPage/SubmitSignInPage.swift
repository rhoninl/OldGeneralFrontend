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
//                        .frame(width: 200,height: 200)
//                        .background(.gray.opacity(0.2))
//                        .cornerRadius(10)
                        .overlay(alignment: .topTrailing) {
                            Text(" × ")
                                .font(.title2)
                                .background(.white)
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
                    self.presentationMode.wrappedValue.dismiss()
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
    }
}

struct SubmitSignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SubmitSignInPage()
    }
}
