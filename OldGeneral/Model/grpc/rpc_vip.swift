//
//  vip.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/27.
//

import Foundation

var vipEndTime: Int64 = 0
var isVIP: Bool = false

func GetVipEndTime() -> Bool {
    let token = GetToken()
    guard token != nil else {
        return false
    }

    let request = Vip_GetVipStatusRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
    }

    do {
        let call = try getAPIClient().getVipStatus(request,callOptions: getOption())
        let response = try call.response.wait()
        vipEndTime = response.endTime
        isVIP = vipEndTime > getTimeStamp()
        print(vipEndTime)
    }catch {
        print("error when get vip status \(error)")
        return false
    }

    return true
}

func ChargeVIP(_ num: Int64) -> Bool {
    let token = GetToken()
    guard token != nil else {
        return false
    }
    
    
    let request = Vip_ChargeVipRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
        my.chargeDuration = num * Int64(Month / 1000)
    }
    
    do {
        let call = try getAPIClient().chargeVip(request,callOptions: getOption())
        _ = try call.response.wait()
    } catch {
        print("error to charge vip \(error)")
        return false
    }
    return GetVipEndTime()
}
