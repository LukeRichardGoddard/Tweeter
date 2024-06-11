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
            
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getRect().width, height: 180, alignment: .center)
                .cornerRadius(0)
            
            if profileImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    KFImage(URL(string: "\(K.Network.server)/users/id/avatar"))
                        .resizable()
                        .placeholder {
                            Image("blankpp")
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
    }
}

extension EditProfileView {
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}
