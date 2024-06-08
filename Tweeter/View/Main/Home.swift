//
//  Home.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            ZStack {
                TabView {
                    Feed()
                        .tabItem {
                            Image("Home")
                        }
                    
                    SearchView()
                        .tabItem {
                            Image("Search")
                        }
                    
                    NotificationsView()
                        .tabItem {
                            Image("Notifications")
                        }
                    
                    MessagesView()
                        .tabItem {
                            Image("Messages")
                        }
                    
                    
                }
            }
        }
    }
}

#Preview {
    Home()
}
