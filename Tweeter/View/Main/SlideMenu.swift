//
//  SlideMenu.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct SlideMenu: View {
    
    @State var show = false
    
    var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Image("logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading, spacing: 12, content: {
                            Text("Cem")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("@cem_salta")
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 20, content: {
                                FollowView(count: 12, title: "Following")
                                FollowView(count: 16, title: "Followers")
                            })
                            .padding(.top, 10)
                            
                            Divider()
                                .padding(.top, 10)
                        })
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }
                        }, label: {
                            Image(systemName: show ? "chevron.down" : "chevron.up")
                                    .foregroundColor(Color("bg"))
                        })
                    }
                    
                    VStack(alignment: .leading) {
                        ForEach(menuButtons, id: \.self) { menuButton in
                            MenuButton(title: menuButton)
                        }
                        
                        Divider()
                            .padding(.top)
                        
                        Button(action: {
                            
                        }, label: {
                            MenuButton(title: "Twitter Ads")
                        })
                        
                        Divider()
                            .padding(.top)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Settings and Privacy")
                                .foregroundColor(.black)
                        })
                        .padding(.top, 20)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Help Centre")
                                .foregroundColor(.black)
                        })
                        .padding(.top, 20)
                        
                        Spacer(minLength: 0)
                        
                        Divider()
                            .padding(.bottom)
                        
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Image("help")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color("bg"))
                            })
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                            }, label: {
                                Image("barcode")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color("bg"))
                            })
                                
                        }
                    }
                    .opacity(show ? 1 : 0)
                    .frame(height: show ? nil : 0)
                    
                    
                    VStack(alignment: .leading, content: {
                        Button(action: {
                            
                        }, label: {
                            Text("Create a New Account")
                                .foregroundColor(Color("bg"))
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Add an Existing Account")
                                .foregroundColor(Color("bg"))
                        })
                        
                        Spacer(minLength: 0)
                    })
                    .opacity(show ? 0 : 1)
                    .frame(height: show ? 0 : nil)
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, edges!.top == 0 ? 15 : edges!.top)
                .padding(.top, edges!.bottom == 0 ? 15 : edges!.bottom)
                .frame(width: width - 90)
                .background(Color(.white))
                .ignoresSafeArea(.all, edges: .vertical)
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    SlideMenu()
}
