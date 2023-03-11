//
//  myFlagList.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/11.
//

import Foundation
import GRPC

func fetchMyFlagList() -> [Cdr_FlagBasicInfo] {
    let request = Flags_SearchMyFlagRequest.with{ my in
        my.requestID = generateUUID()
        my.requestTime = getTimeStamp()
        my.userID = userId
    }
    
    var option = CallOptions()
    option.customMetadata.add(name: "Authorization", value: token!)
    
    do {
        let call = try getAPIClient().searchMyFlag(request,callOptions: option)
        let response = try call.response.wait()
        return response.flags
    } catch {
        print("error to fetch my flag \(error)")
        return []
    }
}
