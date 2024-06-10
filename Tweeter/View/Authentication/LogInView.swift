//
//  LogInView.swift
//  Tweeter
//
//  Created by Luke Goddard on 9/6/2024.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    @State var email: String = ""
    @State var password: String = ""
    @State var emailDone = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if !emailDone {
            VStack {
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
                    
                    Text("To get started first enter your phone, email or @username")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    CustomAuthTextField(placeholder: "Phone, email or @username", text: $email)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {
                        if !email.isEmpty {
                            self.emailDone.toggle()
                        }
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40, alignment: .center)
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                            .overlay(Text("Next")
                                .foregroundColor(.white))
                    })
                    .padding(.bottom, 4)
                    
                    Text("Forgot Password?")
                        .foregroundColor(Color(.blue))
                }
                
            }
        }
        else {
            VStack {
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
                    
                    Text("Enter your password")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    SecureAuthTextField(placeholder: "Password", text: $password)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {
                        self.viewModel.login(email: email, password: password)
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40, alignment: .center)
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                            .overlay(Text("Log in")
                                .foregroundColor(.white))
                    })
                    .padding(.bottom, 4)
                    
                    Text("Forgot Password?")
                        .foregroundColor(Color(.blue))
                }
                
            }
        }
    }
}

#Preview {
    LogInView()
}
