//
//  NotificationCell.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct NotificationCell: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            HStack(alignment: .top) {
                
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(18)
                    
                    Text("Cem ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.primary)
                    
                    +
                    
                    Text("followed you")
                        .foregroundColor(.black)
                    
                })
                
                Spacer(minLength: 0)
            }
            .padding(.leading, 30)
        }
    }
}

#Preview {
    NotificationCell()
}
