//
//  userinfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/5.
//

import Foundation
import GRPC

var userId: String = ""

let defaultUserInfo: Userinfo_UserBasicInfo = Userinfo_UserBasicInfo.with { my in
    my.userID = "defaultUserId"
    my.userName = "defaultUserName"
    my.userGender = "男"
    my.userBirthday = 1649439999000
    my.userSignature = "without any signautre"
}

var userInfo: Userinfo_UserBasicInfo = defaultUserInfo

func getUserBasicInfo(_ userId: String) -> Userinfo_UserBasicInfo? {
    let token = GetToken()
    guard token != nil else {
        return nil
    }
    let request = Userinfo_GetUserInfoRequest.with { my in
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
