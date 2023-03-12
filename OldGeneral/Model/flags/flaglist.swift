//
//  myFlagList.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/11.
//

import Foundation
import GRPC

var needRefreshMyFlag = true

func fetchMyFlagList() -> [Cdr_FlagBasicInfo] {
    let request = Flags_SearchMyFlagRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
    }
    
    do {
        let call = try getAPIClient().searchMyFlag(request,callOptions: getOption())
        let response = try call.response.wait()
        return response.flags
    } catch {
        print("error to fetch my flag \(error)")
        return []
    }
}

func fetchFlagSquareList(_ current_page: Int64) -> [Cdr_FlagSquareItemInfo] {
    let request = Flags_FetchFlagSquareRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.pageSize = pagesize
        my.page = current_page
    }
    
    do {
        let call = try getAPIClient().fetchFlagSquare(request,callOptions: getOption())
        let response = try call.response.wait()
        return response.flags
    } catch {
        print("error to fetch my flag \(error)")
        return []
    }
}

func getFlagInfo(_ flagId: String) -> Cdr_FlagDetailInfo? {
    let request = Flags_GetFlagDetailRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.flagID = flagId
    }
    
    do {
        let call = try getAPIClient().getFlagDetail(request,callOptions: getOption())
        let response = try call.response.wait()
        return response.info
    } catch {
        print("error to get flag detail")
        return nil
    }
}
