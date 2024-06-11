//
//  EditProfileView.swift
//  Tweeter
//
//  Created by Luke Goddard on 11/6/2024.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    
    @State var profileImage: Image?
    @State private var selectedImage: UIImage?
    @State var name = ""
    @State var location = ""
    @State var bio = ""
    @State var websire = ""
    
    @State var imagePickerPresented = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Save")
                            .foregroundColor(.black)
                    })
                }
                .padding()
                
                HStack {
                    Spacer()
                    Text("Edit Profile")
                        .fontWeight(.heavy)
                    Spacer()
                }
            }
            
            VStack {
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width, height: 180, alignment: .center)
                    .cornerRadius(0)
                
                HStack {
                    if profileImage == nil {
                        Button {
                            imagePickerPresented.toggle()
                        } label: {
                            KFImage(URL(string: "\(K.Network.server)/users/id/avatar"))
                                .resizable()
                                .placeholder {
                                    Image("Profile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.leading, 12)
                        }
                        .sheet(isPresented: $imagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                        
                        
                    }
                    else if let image = profileImage {
                        VStack {
                            HStack(alignment: .top) {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .padding(8)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(y: -20)
                            }
                            .padding()
                        }
                        .padding(.leading, 12)
                    }
                    
                    Spacer()
                }
                .padding(.top, -25)
                .padding(.bottom, -10)
                
                VStack {
                    
                    Divider()
                    HStack {
                        ZStack {
                            HStack {
                                Text("Name")
                                    .foregroundColor(.black)
                                .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $name, placeholder: "Add your name")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    HStack {
                        ZStack {
                            HStack {
                                Text("Location")
                                    .foregroundColor(.black)
                                .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $location, placeholder: "Add your location")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    HStack {
                        ZStack(alignment: .topLeading) {
                            HStack {
                                Text("Bio")
                                    .foregroundColor(.black)
                                .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileBioTextField(bio: $bio)
                                .padding(.leading, 86)
                                .padding(.top, -6)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    HStack {
                        ZStack {
                            HStack {
                                Text("Website")
                                    .foregroundColor(.black)
                                .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $websire, placeholder: "Add your website")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView()
}

extension EditProfileView {
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}
