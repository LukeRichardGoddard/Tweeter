//
//  AuthViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    
     func login(email: String, password: String) {
         print("Doing login")
        
        let defaults = UserDefaults.standard
        
        AuthServices.login(email: email, password: password) { result in
            switch result {
            case .success(let data):
                guard let response = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    defaults.set(response.token, forKey: "jsonwebtoken")
                    defaults.set(response.user.id, forKey: "userid")
                    self.isAuthenticated = true
                    self.currentUser = response.user
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
