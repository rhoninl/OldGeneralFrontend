//
//  userinfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/5.
//

import Foundation
import GRPC

var userId: String = ""

let defaultUserInfo: Cdr_UserBasicInfo = Cdr_UserBasicInfo.with { my in
    my.id = "defaultUserId"
    my.name = "defaultUserName"
    my.gender = "男"
    my.createdAt = 1649439999000
    my.signature = "without any signautre"
}

var userInfo: Cdr_UserBasicInfo = defaultUserInfo

func getUserBasicInfo(_ userId: String) -> Cdr_UserBasicInfo? {
    let token = GetToken()
    guard token != nil else {
        return nil
    }
    let request = User_GetUserInfoRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
    }
    
    do {
        let call = try getAPIClient().getUserInfo(request,callOptions: getOption())
        let response = try call.response.wait()
        return response.userInfo
    } catch {
        print("error when get use Info \(error)")
    }
    
    return nil
}

func UpdateUserInfo(userInfo: Cdr_UserBasicInfo) -> Bool {
    let token = GetToken()
    guard token != nil else {
        return false
    }
    
    let request = User_UpdateUserInfoRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userAvatar =  userInfo.avatar
        my.userName = userInfo.name
        my.userGender = userInfo.gender
        my.userSignature = userInfo.signature
    }
    
    do {
        let call = try getAPIClient().updateUserInfo(request,callOptions: getOption())
        _ = try call.response.wait()
    }catch {
        print("error when update user Info")
        return false
    }
    
    return true
}
