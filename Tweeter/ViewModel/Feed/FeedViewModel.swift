//
//  FeedViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 11/6/2024.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    func fetchTweets() {
        
        RequestServices.requestDomain = "\(K.Network.server)/tweets"
        
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
    
}

