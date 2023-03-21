//
//  createFlag.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/11.
//

import Foundation
import GRPC

func CreateFlag(data: Cdr_FlagBasicInfo) -> Bool {
    let request = Flags_CreateFlagRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.info = data
    }
    
    do {
        let call = try getAPIClient().createFlag(request,callOptions: getOption())
        _ = try call.response.wait()
        return true
    } catch {
        print("create flag failed!, error: \(error)")
    }
    return false
}

func signInFlag(_ info: Cdr_SignInInfo) -> Bool {
    var data = info
    data.pictureURL = pictureServerAddress + "\(userId)/\(data.flagID)/\(data.id)" + ".jpg"
    data.createdAt = getTimeStamp()
    let request = Flags_SignInFlagRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.info = data
    }
    
    do {
        let call = try getAPIClient().signInFlag(request,callOptions: getOption())
        _ = try call.response.wait()
        return true
    } catch {
        print("signin flag failed!, error: \(error)")
    }
    return false
}
