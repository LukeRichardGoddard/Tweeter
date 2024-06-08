//
//  FeedView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18, content: {
                TweetCellView(tweet: "Hey Tim, are those regular glasses?", tweetImage: "post")
                ForEach(1...20, id: \.self) { i in
                    TweetCellView(tweet: sampleText)
                    Divider()
                }
            })
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }
    }
}

#Preview {
    Feed()
}
