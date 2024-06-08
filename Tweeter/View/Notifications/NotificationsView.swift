//
//  NotificationsView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(1..<9) { _ in
                
                    NotificationCell()
                    
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
