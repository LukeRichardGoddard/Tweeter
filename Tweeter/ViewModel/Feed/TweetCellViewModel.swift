//
//  TweetCellViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 11/6/2024.
//

import SwiftUI

class TweetCellViewModel: ObservableObject {
    
    @Published var tweet: Tweet
    @Published var user: User?
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.fetchUser(userId: tweet.user)
    }
    
    func fetchUser(userId: String) {
        
        AuthServices.fetchUser(id: userId) { result in
            switch result {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else { return }
                    DispatchQueue.main.async {
                        self.user = user
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
    
    func like() {
        
        RequestServices.requestDomain = "\(K.Network.server)/tweets/\(self.tweet.id)/like"
        
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("The tweet has been liked")
        }
        
    }
    
    func unlike() {
        RequestServices.requestDomain = "\(K.Network.server)/tweets/\(self.tweet.id)/unlike"
        
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("The tweet has been unliked")
        }
        
        
    }
    
}
