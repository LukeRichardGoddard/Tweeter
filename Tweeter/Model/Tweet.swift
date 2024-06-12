//
//  Tweet.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import SwiftUI

struct Tweet: Identifiable, Codable {
    
    let _id: String
    var id: String { return _id }
    let text: String
    let userId: String
    let username: String
    let user: String
    let image: String?
    var likes: [String]
    var didLike: Bool? = false
}

