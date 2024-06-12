//
//  SearchViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 12/6/2024.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchAllUsers()
    }
    
    func fetchAllUsers() {
        
        AuthServices.requestDomain = "\(K.Network.server)/users"
        
        AuthServices.fetchUser() { result in
            switch result {
            case .success(let data):
                do {
                    guard let users = try? JSONDecoder().decode([User].self, from: data as! Data) else { return }
                    
                    DispatchQueue.main.async {
                        self.users = users
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
