//
//  User.swift
//  Tweeter
//
//  Created by Luke Goddard on 10/6/2024.
//

import Foundation

struct ApiResponse: Codable {
    var user: User
    var token: String
}

struct User: Identifiable, Codable {
    var _id: String
    var id: String { return _id }
    let username: String
    let name: String
    let email: String
    var location: String?
    var bio: String?
    var website: String?
    var avatarExists: Bool
    var followers: [String]
    var following: [String]
}