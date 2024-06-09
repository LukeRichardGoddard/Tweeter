//
//  RegisterView.swift
//  Tweeter
//
//  Created by Luke Goddard on 9/6/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    })
                    Spacer()
                }
                .padding(.horizontal)
                
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20, height: 20)
            }
            
            Text("Create your account")
                .font(.title)
                .bold()
                .padding(.top, 25)
            
            VStack(alignment: .leading, spacing: nil) {
                CustomAuthTextField(placeholder: "Name", text: $name)
                CustomAuthTextField(placeholder: "Phone Number or Email", text: $email)
                SecureAuthTextField(placeholder: "Password", text: $password)
            }
            
            Spacer(minLength: 0)
            
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.viewModel.register(reqBody: ["username" : "john123", "name": name, "email": email, "password": "12345678"])
                    }, label: {
                        Capsule()
                            .frame(width: 60, height: 30, alignment: .center)
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                            .overlay(
                                Text("Next")
                                    .foregroundColor(.white))
                    })
                    .padding(.trailing, 24)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
