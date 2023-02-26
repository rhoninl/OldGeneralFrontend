//
//  Token.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/25.
//

import Foundation
import KeychainAccess

let serviceName = "com.oldgeneral"
var token: String? = nil
let keyChain = Keychain(service: serviceName)
let VerifyTokenUrl = serverAddress + "/verification"

func CheckLoginStatus() -> Bool{
    var tokenLegal: Bool = false
    let semaphore = DispatchSemaphore(value: 0)
    if GetToken(false) != nil{
        let url = URL(string: VerifyTokenUrl)!
        var request = URLRequest(url: url)
        request.addValue(token!, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            defer { semaphore.signal() }
            guard error == nil else {
                print("Error: \(error!)")
                RemoveToken()
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                RemoveToken()
                return
            }
            
            print(httpResponse.statusCode)
            tokenLegal = httpResponse.statusCode == 200
            if !tokenLegal {
                print("illegal token, removed, token: \(token!)")
                RemoveToken()
            }
        }
        .resume()
        // wait for http request finished
        semaphore.wait()
        print(tokenLegal)
        return tokenLegal
    } else {
        return false
    }
}

func StoreToken(_ token: String){
    keyChain["Token"] = token
}

func GetToken(_ cache: Bool = true) -> String? {
    if !cache || token == "" {
        token = keyChain["Token"]
    }
    
    return token
}

func RemoveToken() {
    keyChain["Token"] = nil
}
