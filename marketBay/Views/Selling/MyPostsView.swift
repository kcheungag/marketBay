//
//  MyPostsView.swift
//  marketBay
//  For View and Edit listing purpose
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct MyPostsView: View {
    @EnvironmentObject var dataAccess: DataAccess
    
    var body: some View {
        NavigationStack() {
            MenuTemplate().environmentObject(dataAccess)
            PageHeadingFragment(pageTitle: "My Posts")
            
            VStack {
                List {
                    ForEach(dataAccess.loggedInUser!.listings) { listing in
                        NavigationLink{
                            PostView(listing: listing)
                        }label:{
                            MyPostsRow(listing: listing)
                        }
                    }
                }

                NavigationLink(destination: CreatePostView().environmentObject(dataAccess)) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
        }
        .padding()
        .navigationBarTitle("My Posts")
    }
}

#Preview {
    MyPostsView()
}
