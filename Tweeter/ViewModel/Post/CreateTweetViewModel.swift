//
//  CreateTweetViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import Foundation

class CreateTweetViewModel: ObservableObject {
    
    func uploadPost(text: String) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "\(K.Network.server)/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
            print(result)
        }
    }
    
}
