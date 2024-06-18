//
//  SearchUserCell.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI
import Kingfisher

struct SearchUserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: "\(K.Network.server)/users/\(self.user.id)/avatar"))
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(self.user.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Text("@\(self.user.username)")
                    .foregroundColor(.black)
            }
            
            Spacer(minLength: 0)
        }
    }
}
