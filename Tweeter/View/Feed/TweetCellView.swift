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
    
    var didLike: Bool { return viewModel.tweet.didLike ?? false }
    
    init(viewModel: TweetCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10, content: {
                if let user = viewModel.user {
                    NavigationLink(destination: UserProfile(user: viewModel.user!)) {
                        KFImage(URL(string: "\(K.Network.server)/users/\(self.viewModel.tweet.userId)/avatar"))
                            .placeholder({
                                Image("blankpp")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                }
                
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
                    
                    let imageId = viewModel.tweet.id
                    
                    if viewModel.tweet.image == "true" {
                        
                        GeometryReader { proxy in
                            KFImage(URL(string: "\(K.Network.server)/tweets/\(imageId)/image"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width, height: 250)
                                .cornerRadius(15)
                        }
                        .frame(height: 250)
                        
                    }
                    
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
                    if (self.didLike) {
                        self.viewModel.unlike()
                    } else {
                        self.viewModel.like()
                    }
                }, label: {
                    if (self.didLike) {
                        Image("love")
                            .resizable().renderingMode(.template).foregroundColor(.red)
                        .frame(width: 18, height: 15)
                    } else {
                        Image("love")
                            .resizable()
                        .frame(width: 18, height: 15)
                    }
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

