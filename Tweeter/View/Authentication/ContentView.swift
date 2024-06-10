//
//  ContentView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.isAuthenticated {
            if let user = viewModel.currentUser {
                MainView(user: user)
            }
        } else {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
