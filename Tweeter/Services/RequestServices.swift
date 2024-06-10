//
//  RequestServices.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import Foundation

public class RequestServices {
    
    public static var requestDomain = ""
    
    public static func postTweet(text: String, user: String, username: String, userId: String, completion: @escaping (_ result: [String:Any]?) -> Void) {
        
        let params = ["text": text, "userId": userId, "username": username, "user": user] as [String:Any]
        
        let urlString = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: urlString)
        
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print(error)
        }
        
        // AUTHENTICATION
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else { return }
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] {
                    completion(json)
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
    
    static func fetchTweets(completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let data = data else { return }
            
            completion(.success(data))
        }
        
        task.resume()
    }
    
}
