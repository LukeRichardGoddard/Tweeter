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
        AuthServices.getUsers(vm: self)
        DispatchQueue.main.async {
            print("\(self.users.count) users")
        }
    }
    
    func getUsers(vm: SearchViewModel) -> [User] {
        
        if let url = URL(string: "\(K.Network.server)/users") {
            
            let session = URLSession.shared
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request) { data, res, err in
                guard err == nil else { return }
                guard let data = data else {
                    return
                }
                
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        vm.users = users
                    }
                } catch {
                    print(error)
                }
            }
            
            task.resume()
        }
        
        return [User]()
        
    }
    
    func loadUsers(theUsers: [User]) {
        DispatchQueue.main.async {
            self.users = theUsers
        }
    }
}
