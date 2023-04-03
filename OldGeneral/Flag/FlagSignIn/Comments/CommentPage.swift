//
//  CommentPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/2.
//

import SwiftUI

struct CommentPage: View {
    var signInId: String? = ""
    @State var commentList: [Cdr_CommentInfo] = []
    @State private var isCommenting: Bool = false
    @State private var comment: String = ""
    @State private var isFetching: Bool = false
    @State private var lastCommentId: String = ""
    @State private var hasMore: Bool = true
    @FocusState private var isFocus: Bool
    var body: some View {
        ZStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible())],alignment: .leading) {
                    ForEach(commentList, id: \.self) { index in
                        Commentitem(comment: index)
                            .onAppear{
                                if index == commentList.last &&
                                    hasMore &&
                                    !isFetching {
                                        Task{
                                            await fetchComment()
                                        }
                                    }
                            }
                    }
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                isCommenting = false
            }
            VStack{
                Spacer()
                if isCommenting {
                    TextField("Enter your comment", text: $comment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .focused($isFocus)
                        .onAppear{
                            isFocus.toggle()
                        }
                        .onSubmit{
                            print("submit \(comment)")
                            guard commentSignin(signInId: signInId ?? "", content: comment) else {
                                print("error to comment signin")
                                return
                            }
                            comment = ""
                            isCommenting = false
                        }
                        .submitLabel(.done)
                    
                } else {
                    Button {
                        isCommenting.toggle()
                    } label: {
                        Text("评论")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: 20)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.yellow)
                    .padding([.leading,.trailing],10)
                }
            }
        }
        .onAppear{
            Task{
                await fetchComment()
            }
        }
    }
    
    func fetchComment() async {
        if ispreview {
            return
        }
        isFetching = true
        defer {isFetching = false}
        
        let fetchedData = FetchComment(signInId!,lastCommentId: lastCommentId)
        if fetchedData.count < pagesize {
            hasMore = false
        }
        commentList += fetchedData
    }
}

struct CommentPage_Previews: PreviewProvider {
    static var previews: some View {
        let comment1 = Cdr_CommentInfo.with{ my in
            my.id = "123"
            my.createdAt = getTimeStamp()
            my.content = "content"
            my.signinID = "id"
        }
        let comment2 = Cdr_CommentInfo.with{ my in
            my.id = "1234"
            my.createdAt = getTimeStamp()
            my.content = "content1"
            my.signinID = "id1"
        }
        if preview() {}
        CommentPage(signInId: "id",commentList: [comment1,comment2])
    }
}
