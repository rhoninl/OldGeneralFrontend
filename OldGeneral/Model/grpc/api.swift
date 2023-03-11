//
//  api.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import Foundation
import NIOCore
import NIOPosix
import GRPC

private var ApiClient: Api_apiNIOClient?

func NewApiClient() throws -> Api_apiNIOClient {
    let group = MultiThreadedEventLoopGroup(numberOfThreads: 3)
    
    // Configure the channel, we're not using TLS so the connection is `insecure`.
    let channel = try GRPCChannelPool.with(
        target: .host(serverAddress, port: grpcServerPort),
        transportSecurity: .plaintext,
        eventLoopGroup: group
    )
   return Api_apiNIOClient(channel: channel)
}

func getAPIClient() throws -> Api_apiNIOClient {
    if ApiClient == nil {
        ApiClient = try NewApiClient()
        print("get APi Client")
    }
    
    return ApiClient!
}

func getOption() -> CallOptions {
    var option = CallOptions()
    option.customMetadata.add(name: "Authorization", value: GetToken()!)
    return option
}
