//
//  WelcomeView.swift
//  Tweeter
//
//  Created by Luke Goddard on 9/6/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Image("Twitter")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                Text("See what is happening in the world right now")
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .frame(width: (getRect().width * 0.9), alignment: .center)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 10) {
                    Button(action: {
                        print("Sign in with Google")
                    }, label: {
                        HStack(spacing: 0 ) {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            
                            Text("Continue with Google")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.black, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        }
                    })
                    
                    Button(action: {
                        print("Sign in with Apple")
                    }, label: {
                        HStack(spacing: 0 ) {
                            Image("apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            
                            Text("Continue with Apple")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.black, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        }
                    })
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect().width / 3), height: 1)
                        Text("Or")
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect().width / 3), height: 1)
                    }
                    
                    RoundedRectangle(cornerRadius: 36)
                        .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                        .frame(width: 320, height: 60, alignment: .center)
                        .overlay {
                            Text("Create Account")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                        }
                    
                }
                .padding()
                
                VStack(alignment: .leading) {
                    VStack {
                        Text("By signing up, you agree to our ")
                        + Text("Terms")
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                        + Text(",")
                        + Text(" Privacy Policy")
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                        + Text(" and Cookie Use")
                        
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 2) {
                        Text("Have an account already?")
                        Text("Log in")
                            .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

#Preview {
    WelcomeView()
}
