//
//  siegeflag.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/2.
//

import Foundation
import GRPC

func SiegeFlag(_ flagId: String) -> Bool {
    let request = Flags_SiegeFlagRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
        my.flagID = flagId
    }
    
    do {
        let call = try getAPIClient().siegeFlag(request,callOptions: getOption())
        _ = try call.response.wait()
        return true
    } catch {
        print("error to siege flag \(error)")
    }
    return false
}

func CheckFlagisSieged(_ flagId: String) -> Bool {
    let request = Flags_CheckIsSiegeRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
        my.flagID = flagId
    }
    
    do {
        let call = try getAPIClient().checkIsSiege(request,callOptions: getOption())
        let response = try call.response.wait()
        return response.isSiege
    } catch {
        print("error to check sieged \(error)")
    }
    
    return false
}
