//
//  AuthViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func register(reqBody: [String:Any]) {
        let urlString = URL(string: "http://192.168.1.99:3000/users")
        
        let session = URLSession.shared
        
        var request = URLRequest(url: urlString!)
        
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
            guard data == data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any] {
                    
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
    }
    
    func logout() {
        
    }
    
}
