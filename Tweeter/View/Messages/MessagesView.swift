//
//  MessagesView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<9) { _ in
                    MessageCell()
                }
            }
        }
    }
}

#Preview {
    MessagesView()
}
