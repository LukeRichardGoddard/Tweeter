//
//  TweetCellView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    
    @ObservedObject var viewModel: TweetCellViewModel
    
    init(viewModel: TweetCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    (
                        Text("\(self.viewModel.tweet.username)")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        Text("@\(self.viewModel.tweet.username)")
                            .foregroundColor(.gray)
                    )
                    
                    Text(self.viewModel.tweet.text)
                        .frame(maxHeight: 100, alignment: .top)
                    
//                    if let imageId = viewModel.tweet.id {
//                        
//                        if viewModel.tweet.image == "true" {
//                            
//                            GeometryReader { proxy in
//                                
//                            }
//                            
//                        }
//                        
//                    }
                        
                })
                Spacer()
            })
            
            // Cell bottom
            
            HStack(spacing: 50, content: {
                Button(action: {
                    
                }, label: {
                    Image("Comments")
                        .resizable()
                        .frame(width: 16, height: 16)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image("Retweet")
                        .resizable()
                        .frame(width: 18, height: 14)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image("love")
                        .resizable()
                        .frame(width: 18, height: 15)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image("upload")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 15)
                }).foregroundColor(.gray)
            })
            .padding(.top, 4)
        }
    }
}

#Preview {
    TweetCellView(viewModel: TweetCellViewModel(tweet: Tweet(_id: "6666f71dcaef24bb4329285b", text: "I love flowers", userId: "66669030caef24bb432926a7", username: "Lukerg321", user: "66669030caef24bb432926a7", image: nil, likes: [])))
}

var sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
