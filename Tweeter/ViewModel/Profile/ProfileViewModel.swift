//
//  ProfileViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 12/6/2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var tweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        fetchTweets()
        checkIfUserIsCurrentUser()
    }
    
    func fetchTweets() {
        
        RequestServices.requestDomain = "\(K.Network.server)/tweets/\(self.user.id)"
        
        RequestServices.fetchTweets { result in
            switch result {
                case .success(let data):
                    guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else { return }
                    DispatchQueue.main.async {
                        self.tweets = tweets
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        
    }
    
    func checkIfUserIsCurrentUser() {
        
        if (self.user._id == AuthViewModel.shared.currentUser?._id) {
            self.user.isCurrentUser = true
        } else {
            self.user.isCurrentUser = false}
    }
}
