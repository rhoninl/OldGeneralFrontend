//
//  comment.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/2.
//

import Foundation
import GRPC

func commentSignin(signInId: String, content: String) -> Bool {
    let comment = Cdr_CommentInfo.with{ my in
        my.id = generateUUID()
        my.signinID = signInId
        my.userInfo.id = userId
        my.content = content
        my.createdAt = getTimeStamp()
    }
    let request = Flags_PostCommentRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.comment = comment
    }
    
    do {
        let call = try getAPIClient().postComment(request,callOptions: getOption())
        _ = try call.response.wait()
        return true
    }  catch {
        print("error to comment signin \(error)")
    }
    return false
}

func FetchComment(_ signinId: String, lastCommentId: String = "") -> [Cdr_CommentInfo] {
    let request = Flags_FetchCommentRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.pageSize = pagesize
        my.lastCommentID = lastCommentId
        my.signinID = signinId
    }
    
    do {
        let call = try getAPIClient().fetchComment(request,callOptions: getOption())
        let response = try call.response.wait()
        return response.comments
    } catch {
        print("error to fetch Signin \(error)")
    }
    return []
}
