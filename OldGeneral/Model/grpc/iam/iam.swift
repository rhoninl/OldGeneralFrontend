//
//  Login.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import Foundation
import GRPC

func Login(username: String, password: String) -> Bool {
    let request = Iam_IamLoginRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userName = username
        my.password = password
    }
    
    do {
        let call = getAPIClient().iAMLogin(request)
        let resp = try call.response.wait()
        print(resp.token)
        StoreToken(resp.token)
        userId = resp.userID
        print("userId \(userId)")
        return true
    }catch {
        print("user login failed\(error)")
    }
    return false
}

func SignUp(username: String, password: String) -> Bool {
    let request = Iam_CreateUserRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userName = username
        my.password = password
    }
    
    do {
        let call = getAPIClient().iAMRegister(request)
        let response = try call.response.wait()
        return response.isSuccess
    }catch {
        print("user register failed")
    }
    return false
}

func CheckLoginStatus() -> Bool {
    let token = GetToken()
    guard token != nil else {
        print("token is nil")
        return false
    }

    
    let request = Iam_IamCheckStatusRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
    }
    
    var option = CallOptions()
    option.customMetadata.add(name: "Authorization", value: token!)
    do {
        let call = getAPIClient().iAMCheckLoginStatus(request,callOptions: option)
        let response = try call.response.wait()
        userId = response.userID
        print("userId \(userId)")
        return response.isValid
    } catch {
        print("check login status failed \(error)")
    }
    return false
}
