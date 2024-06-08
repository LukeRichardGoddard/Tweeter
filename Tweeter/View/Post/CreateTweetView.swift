//
//  CreateTweetView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct CreateTweetView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack {
            HStack {
                
                Button(action: {
                    
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Tweet")
                        .padding()
                })
                .background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())
                
            }
            
            MultilineTextField(text: $text)
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    CreateTweetView()
}
