//
//  CustomProfileTextField.swift
//  Tweeter
//
//  Created by Luke Goddard on 12/6/2024.
//

import SwiftUI

struct CustomProfileTextField: View {
    
    @Binding var message: String
    var placeholder: String
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    if message.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                
                TextField("", text: $message)
                    .foregroundColor(.blue)
            }
        }
    }
}
