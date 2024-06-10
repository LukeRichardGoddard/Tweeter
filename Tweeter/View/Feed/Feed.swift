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
            LazyVStack(spacing: 18, content: {
                ForEach(viewModel.tweets) { tweet in
                    Text("\(viewModel.tweets.count) tweets")
                    TweetCellView(viewModel: TweetCellViewModel(tweet: tweet))
                    Divider()
                }
            })
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }
    }
}
