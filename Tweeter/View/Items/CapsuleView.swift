//
//  CapsuleView.swift
//  Tweeter
//
//  Created by Luke Goddard on 12/6/2024.
//

import SwiftUI

struct CapsuleView: View {
    var isFollowed: Bool
    
    var body: some View {
        Text(isFollowed ? "Following" : "Follow")
            .foregroundColor(isFollowed ? .black : .blue)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(
                ZStack {
                    Capsule()
                        .stroke(Color.black, lineWidth: 1.5)
                        .foregroundColor(isFollowed ? .white : .black)
                    
                    Capsule()
                        .foregroundColor(isFollowed ? .white : .black)
                })
    }
}

#Preview {
    CapsuleView(isFollowed: true)
}
