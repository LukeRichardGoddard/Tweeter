//
//  SearchView.swift
//  Tweeter
//
//  Created by Luke Goddard on 8/6/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var text = "Search"
    @State var isEditing = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    init() {
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView {
                SearchBarView(searchText: $text, isEditing: $isEditing)
                    .padding(.horizontal)
                
                LazyVStack {
                    
                    ForEach(self.viewModel.users) { user in
                        SearchUserCell(user: user)
                            .padding(.leading)
                    }
                    
                }
                
//                if !isEditing {
//                    List(1..<20) { i in
//                        SearchCell(tag: "\(i))", tweets: "\(i)")
//                    }.listStyle(PlainListStyle())
//                } else {
//                    List(1..<9) { i in
//                        SearchUserCell()
//                    }.listStyle(PlainListStyle())
//                }
            }
            

        }
    }
}

#Preview {
    SearchView()
}
