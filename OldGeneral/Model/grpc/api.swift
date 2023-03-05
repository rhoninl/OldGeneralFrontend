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
    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    
    // Configure the channel, we're not using TLS so the connection is `insecure`.
    let channel = try GRPCChannelPool.with(
        target: .host(serverAddress, port: grpcServerPort),
        transportSecurity: .plaintext,
        eventLoopGroup: group
    )
   return Api_apiNIOClient(channel: channel)
}

func getAPIClient() -> Api_apiNIOClient {
    if ApiClient == nil {
        do {
            ApiClient = try NewApiClient()
            print("get APi Client")
        } catch {
            print("Cannot to Connect Server")
            exit(1)
        }
    }
    return ApiClient!
}
