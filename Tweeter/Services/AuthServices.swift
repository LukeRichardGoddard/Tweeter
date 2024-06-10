//
//  AuthServices.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

public class AuthServices {
    
    static func login(email: String, password: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        let urlString = URL(string: "\(K.Network.server)/users/login")!
        
        makeRequest(urlString: urlString, reqBody: ["email": email, "password": password]) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func register(email: String, username: String, password: String, name: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        let urlString = URL(string: "\(K.Network.server)/users")!
        
        makeRequest(urlString: urlString, reqBody: ["email" : email.lowercased(), "username": username, "name": name, "password": password]) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func makeRequest(urlString: URL, reqBody: [String:Any], completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        
            let session = URLSession.shared
            
            var request = URLRequest(url: urlString)
            
            request.httpMethod = "POST"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
            } catch {
                print(error)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request) { data, res, err in
                
                guard err == nil else { return }
                guard data == data else {
                    completion(.failure(.noData))
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any] {
                        
                    }
                } catch {
                    completion(.failure(.decodingError))
                    print(error)
                }
                
            }
            
            task.resume()
    }
}
