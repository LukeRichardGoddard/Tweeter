//
//  MainView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TopBar()
            Home()
        }
    }
}

#Preview {
    MainView()
}
