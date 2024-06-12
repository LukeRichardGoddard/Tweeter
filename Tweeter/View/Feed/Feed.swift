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
        RefreshableScrollView(content:
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 18, content: {
                    ForEach(viewModel.tweets) { tweet in
                        TweetCellView(viewModel: TweetCellViewModel(tweet: tweet, currentUser: user))
                        Divider()
                    }
                })
                .padding(.top)
                .padding(.horizontal)
                .zIndex(0)
            }
        ) { control in
            DispatchQueue.main.async {
                self.viewModel.fetchTweets()
                control.endRefreshing()
            }
        }
    }
}
