//
//  wallet.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/26.
//

import Foundation

func getCurrentMoney() -> Int64 {
    let token = GetToken()
    guard token != nil else {
        return 0
    }
    let request = Wallet_GetCurrentGoldRequest.with { my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
    }
    
    do {
        let call = try getAPIClient().getCurrentGold(request,callOptions: getOption())
        let response = try call.response.wait()
        return response.goldNum
    } catch {
        print("error when get current gold \(error)")
    }
    
    return 0
}

func updateMoney(_ num: Int64) -> Bool {
    let token = GetToken()
    guard token != nil else {
        return false
    }
    
    let request = Wallet_UpdateGoldRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.goldNum = num
        my.userID = userId
    }
    
    do {
        let call = try getAPIClient().updateGold(request,callOptions: getOption())
        _ = try call.response.wait()
    } catch {
        print("error to update gold \(error)")
        return false
    }
    
    return true
}
