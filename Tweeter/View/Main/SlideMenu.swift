//
//  SlideMenu.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI
import Kingfisher

var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]

struct SlideMenu: View {
    
    @State var show = false
    @ObservedObject var viewModel: AuthViewModel
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    NavigationLink(destination: UserProfile(user: viewModel.currentUser!)) {
                        KFImage(URL(string: "\(K.Network.server)/users/\(self.viewModel.currentUser!.id)/avatar"))
                            .placeholder({
                                Image("blankpp")
                                    .resizable()
                            })
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading, spacing: 12, content: {
                            NavigationLink(destination: UserProfile(user: viewModel.currentUser!)) {
                                Text(viewModel.currentUser!.name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            Text(viewModel.currentUser!.username)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 20, content: {
                                FollowView(count: viewModel.currentUser!.following.count, title: "Following")
                                FollowView(count: viewModel.currentUser!.followers.count, title: "Followers")
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
                            NavigationLink(destination: UserProfile(user: viewModel.currentUser!)) {
                                MenuButton(title: menuButton)
                            }
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
                            viewModel.logout()
                        }, label: {
                            Text("Log Out")
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
