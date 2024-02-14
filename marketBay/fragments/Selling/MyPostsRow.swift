//
//  MyPostsRow.swift
//  marketBay
//
//  Created by EmJhey PB on 2/14/24.
//

import SwiftUI

struct MyPostsRow: View {
    var listing: Listing
    
    var body: some View {
        HStack {
            // Image, Title, Price
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(listing.title)
                Text("$ \(String(format: "%0.2f", listing.price))")
            }
            
            Spacer()
        }
    }
}

#Preview {
    MyPostsRow(listing: Listing(id: 1, title: "Unlock! A Noside Story", description: "Secret Adventures: Part 1", category: "Toys", price: 25.0, seller: User(id: 1, name: "MJ", email: "mb", password: "mb", phoneNumber: "123"), email: "users[0].email", phoneNumber: "users[0].phoneNumber"))
}
