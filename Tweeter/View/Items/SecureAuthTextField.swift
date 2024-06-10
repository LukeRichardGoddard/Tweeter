//
//  SecureAuthTextField.swift
//  Tweeter
//
//  Created by Luke Goddard on 9/6/2024.
//

import SwiftUI

struct SecureAuthTextField: View {
    var placeholder: String = "Placeholder"
    @Binding var text: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                }
                SecureField("", text: $text)
                    .frame(height: 45)
                    .foregroundColor(K.Colors.tweeterBlue)
            }
            
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.gray)
                .padding(.top, -2)
        }
        .padding(.horizontal)
    }
}
