//
//  PostView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/12/24.
//

import SwiftUI

struct PostView: View {
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
    PostView()
}
