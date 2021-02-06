//
//  UrMessage.swift
//  peepMessage
//
//  Created by Home on 5/27/20.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct Message: Codable  {
    var success: Int
    var message: String
    
    init(json: [String: Any]) {
        success = json["success"] as? Int ?? 0
        message = json["message"] as? String ?? ""
    }
}

class UrMessage {
    var uid: UInt = 5
    func setUser(pid: UInt) {
        uid = pid;
    }
    
    func getNewMessage(completion: @escaping([Message]) -> ()) {
//        let url = URL(string: String("http://3.92.12.25/message.php"))
        let url = URL(string: String("http://www.idzeropoint.com/message.php"))
        var request = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        request.httpMethod = "POST"

        let postString = String("uid=\(uid)&opt=-1&msg=")
        request.httpBody = postString.data(using: .utf8, allowLossyConversion: true)
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data=data, error==nil else {
                completion([])
                return
            }

            do {
                let message = [try JSONDecoder().decode(Message.self, from: data)]
                DispatchQueue.main.async {
                    completion(message)
                }
            }
            catch let parsingError {
                print("Error: ", parsingError)
            }
        }.resume()
    }
}
