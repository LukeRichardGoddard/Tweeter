//
//  WelcomeView.swift
//  Tweeter
//
//  Created by Luke Goddard on 9/6/2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                    
                    NavigationLink(destination: RegisterView().navigationBarHidden(true)) {
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundColor(K.Colors.tweeterBlue)
                            .frame(width: 320, height: 60, alignment: .center)
                            .overlay {
                                Text("Create Account")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                        }
                    }
                    
                }
                .padding()
                
                VStack(alignment: .leading) {
                    VStack {
                        Text("By signing up, you agree to our ")
                        + Text("Terms")
                            .foregroundColor(K.Colors.tweeterBlue)
                        + Text(",")
                        + Text(" Privacy Policy")
                            .foregroundColor(K.Colors.tweeterBlue)
                        + Text(" and Cookie Use")
                        
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 2) {
                        Text("Have an account already?")
                        NavigationLink(destination: LogInView().navigationBarHidden(true)) {
                            Text("Log in")
                                .foregroundColor(K.Colors.tweeterBlue)
                        }
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
