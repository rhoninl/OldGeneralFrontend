//
//  http.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/25.
//

import Foundation



func sendPutRequest(fileName:String ,data: Data) -> Bool{
    let semaphore = DispatchSemaphore(value: 0)
    var isSuccess = false
    let url: URL = URL(string: pictureServerAddress + fileName + ".jpg")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.addValue("image/jpeg", forHTTPHeaderField: "Content-Type")

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

