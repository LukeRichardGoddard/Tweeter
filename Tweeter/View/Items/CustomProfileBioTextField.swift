//
//  CustomProfileBioTextField.swift
//  Tweeter
//
//  Created by Luke Goddard on 12/6/2024.
//

import SwiftUI

struct CustomProfileBioTextField: View {
    
    @Binding var bio: String

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                if bio.isEmpty {
                    HStack {
                        Text("Add a bio to your profile")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.top, 8)
                    .padding(.leading, 4)
                    .zIndex(1)
                }
                TextEditor(text: $bio)
                    .foregroundColor(.blue)
            }
        }
        .frame(height: 90)
    }
}
