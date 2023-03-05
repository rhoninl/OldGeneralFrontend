//
//  userinfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/5.
//

import Foundation
import GRPC

var userId: String = ""

func getUserBasicInfo(_ userId: String) -> Userinfo_UserBasicInfo? {
    let token = GetToken()
    let request = Userinfo_GetUserInfoRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
    }
        
    var option = CallOptions()
    option.customMetadata.add(name: "Authorization", value: token!)
    
    do {
        let call = getAPIClient().userInfoGet(request,callOptions: option)
        let response = try call.response.wait()
        return response.userInfo
    } catch {
        print("error when get use Info \(error)")
    }
    
    return nil
}
