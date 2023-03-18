//
//  Login.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import Foundation
import GRPC

var isLogined = false

func Login(username: String, password: String) -> Bool {
    let request = Iam_IamLoginRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userName = username
        my.password = password
    }
    
    do {
        let call = try getAPIClient().iAMLogin(request)
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
        let call = try getAPIClient().iAMRegister(request)
        let response = try call.response.wait()
        return response.isSuccess
    }catch {
        print("user register failed\(error)")
    }
    return false
}

func CheckLoginStatus() -> Bool {
    let token = GetToken()
    guard token != nil else {
        print("token is nil")
        return false
    }

    guard !isLogined else {
        return true
    }
    
    let request = Iam_IamCheckStatusRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
    }
    
    do {
        let call = try getAPIClient().iAMCheckLoginStatus(request,callOptions: getOption())
        let response = try call.response.wait()
        userId = response.userID
        print("userId \(userId)")
        return response.isValid
    } catch {
        print("check login status failed \(error)")
    }
    return false
}
