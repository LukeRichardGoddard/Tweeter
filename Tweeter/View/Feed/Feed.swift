//
//  FeedView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct Feed: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    let user: User
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18, content: {
                TweetCellView(tweet: "Hey Tim, are those regular glasses?", tweetImage: "post")
                Text("\(viewModel.tweets.count) tweets")
                List(viewModel.tweets) { i in
                    TweetCellView(tweet: i.text)
                    Divider()
                }
            })
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }
    }
}
