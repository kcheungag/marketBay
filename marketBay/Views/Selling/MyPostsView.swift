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
            Text("My Posts")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
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
