//
//  MessageCell.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct MessageCell: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60
                           , alignment: .center)
                    .cornerRadius(30)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack {
                        Text("Cem")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("@cem_salta")
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        
                        Text("8/6/24")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    
                    Text("You: Hey! How is it going?")
                    
                    Spacer()
                })
            }
            .padding(.top, 2)
        }
        .frame(width: width, height: 84)
    }
}

#Preview {
    MessageCell()
}
