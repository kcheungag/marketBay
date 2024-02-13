//
//  AddPostsView.swift
//  marketBay
//
//  Created by Cheung K on 12/2/2024.
//

import SwiftUI

struct CreatePostView: View {
    
    var body: some View {
        BackMenuFragment()
        VStack {
            VStack {
                Text("Test")
                Spacer()
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CreatePostView()
}
