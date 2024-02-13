//
//  MyPostsView.swift
//  marketBay
//  For View and Edit listing purpose
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct MyPostsView: View {
    var body: some View {
        NavigationStack() {
            MenuTemplate()
            VStack {
                Spacer()
                NavigationLink(destination: CreatePostView()) {
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
