//
//  TweetCellViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 11/6/2024.
//

import SwiftUI

class TweetCellViewModel: ObservableObject {
    
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
}
