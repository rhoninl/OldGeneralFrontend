//
//  props.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/5.
//

import Foundation

func GetMaskNumByDay (_ dayNum: Int64) -> Int64 {
    let num = dayNum / 7
    return isVIP ? num * 2 : num
}

func GetResurrectNumByDay(_ dayNum: Int64) -> Int64 {
    return dayNum >= 30 ? 1 : 0
}

func ResurrectFlag(_ flagId: String) -> Bool {
    let request = Flags_ResurrectRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
        my.flagID = flagId
    }
    
    do {
        let call = try getAPIClient().resurrect(request,callOptions: getOption())
        _ = try call.response.wait()
        needRefreshMyFlag = true
        return true
    }catch {
        print("error to resurrect flag\(error)")
    }
    return false
}
