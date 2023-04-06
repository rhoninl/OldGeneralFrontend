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
        needRefreshMyFlag = true
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
        needRefreshMyFlag = true
        return true
    } catch {
        print("signin flag failed!, error: \(error)")
    }
    return false
}

func SkipFlag(_ flagId: String) -> Bool {
    let request = Flags_AskForSkipRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
        my.flagID = flagId
    }
    
    do {
        let call = try getAPIClient().askForSkip(request,callOptions: getOption())
        _ = try call.response.wait()
        needRefreshMyFlag = true
        return true
    } catch {
        print("error to skip the flag")
    }
    return false
}

func CheckFlagNeedSigninToday(_ info: Cdr_FlagDetailInfo) -> Bool {
    let calendar = Calendar.current

    let startTime = Date(timeIntervalSince1970: Double(info.createdAt) / Double(MS))
    let currentTime = Date()

    let components = calendar.dateComponents([.day], from: startTime, to: currentTime)
    let days = components.day!

    print(days)
    print(info.currentTime)
    return days == info.currentTime
}
