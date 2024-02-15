//
//  PostView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/12/24.
//

import SwiftUI

struct PostView: View {
    var listing: Listing
    
    var body: some View {
        BackMenuFragment()
        VStack {
            VStack {
                Text("\(listing.id)")
                Text(listing.title)
                Text(listing.status.rawValue)
                
                Text(listing.seller.name)
                Text(listing.seller.email)
                Text(listing.seller.phoneNumber)
                Spacer()
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PostView(listing: Listing(id: 1, title: "Unlock! A Noside Story", description: "Secret Adventures: Part 1", category: .toys, price: 25.0, seller: User(id: 1, name: "MJ", email: "mb", password: "mb", phoneNumber: "123"), email: "users[0].email", phoneNumber: "users[0].phoneNumber", status: .available))
}
