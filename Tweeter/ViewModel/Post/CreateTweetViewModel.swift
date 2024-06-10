//
//  CreateTweetViewModel.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import SwiftUI

class CreateTweetViewModel: ObservableObject {
    
    func uploadPost(text: String, image: UIImage?) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "\(K.Network.server)/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
            
            if let image = image {
                if let id = result?["_id"]! {
                    ImageUploader.uploadImage(paramName: "upload", fileName: "image1", image: image, urlPath: "/uploadTweetImage/\(id)")
                }
            }
        }
    }
    
}
