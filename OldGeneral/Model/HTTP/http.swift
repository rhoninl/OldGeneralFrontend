//
//  http.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/25.
//

import Foundation
import CryptoKit
import UIKit

func sendPutRequest(fileName:String ,data: Data) -> Bool{
    let semaphore = DispatchSemaphore(value: 0)
    var isSuccess = false
    let url: URL = URL(string: pictureServerAddress + fileName + ".jpg")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.addValue("image/jpeg", forHTTPHeaderField: "Content-Type")
//    print(generateAuth(fileName: fileName, data: data))
    request.httpBody = data

    URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
        print("Request successful")
        isSuccess = true
    } else {
        print("Request failed")
    }
    semaphore.signal()
    }.resume()
    semaphore.wait()
    
    return isSuccess
}

func getImageFromURL(_ url: String) -> UIImage? {
    let semaphore = DispatchSemaphore(value: 0)
    var image: UIImage = UIImage()
    
    var request = URLRequest(url: URL(string: url)!)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        image = UIImage(data: data)!
        semaphore.signal()
    }.resume()
    semaphore.wait()
    
    return image
}

//func generateAuth( fileName: String,data: Data) -> String {
//    let verb = "POST"
//    let contentType = "image/jpeg"
//    let date = getTimestampRFC1123()
//    let resource = "/oldgeneral/avatars/" + fileName
//    let stringToSignig = verb + contentType + date + resource
//    print(date)
//    guard let keyData = secretAccessKey.data(using: .utf8), let messageData = stringToSign.data(using: .utf8) else {
//        return nil{
//    }
//
//    var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
//    CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), (keyData as NSData).bytes, keyData.count, (messageData as NSData).bytes, messageData.count, &digest)
//
//    let hmacData = Data(bytes: digest, count: digest.count)
//    return hmacData.base64EncodedString()}
//    return stringToSignig.data(using: .utf8)!.base64EncodedString()
//}
//
//func getMd5(_ data: Data) -> String {
//    let hash = Insecure.MD5.hash(data: data)
//    return hash.map { String(format: "%02hhx", $0) }.joined()
//}
//
