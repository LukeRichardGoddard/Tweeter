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
    
    func register(name: String, username: String, email: String, password: String) {
        AuthServices.register(email: email, username: username, password: password, name: name) { result in
            switch result {
            case .success(let data):
                guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data) else {
                    return
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        
    }
    
}
