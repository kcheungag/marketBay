//
//  ConfirmPostView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/14/24.
//

import SwiftUI

struct ConfirmPostView: View {
    var listing: Listing
    
    var body: some View {
        VStack {
            //        BackMenuFragment()
            PageHeadingFragment(pageTitle: "Confirm Post")
            
            // MARK: Listing Details
            //        let id: Int
            //        let title: String
            //        let description: String
            //        let category: String
            //        let price: Double
            //        let seller: User
            //        let email: String
            //        let phoneNumber: String
            
            // MARK: Seller Details
            //        let seller: User
            //        let email: String
            //        let phoneNumber: String
            Spacer()
            
            Button {
                ConfirmPostView(listing: Listing(id: 1, title: "Unlock! A Noside Story", description: "Secret Adventures: Part 1", category: "Toys", price: 25.0, seller: User(id: 1, name: "MJ", email: "mb", password: "mb", phoneNumber: "123"), email: "users[0].email", phoneNumber: "users[0].phoneNumber"))
            }label: {
                Text("P O S T")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ConfirmPostView(listing: Listing(id: 1, title: "Unlock! A Noside Story", description: "Secret Adventures: Part 1", category: "Toys", price: 25.0, seller: User(id: 1, name: "MJ", email: "mb", password: "mb", phoneNumber: "123"), email: "users[0].email", phoneNumber: "users[0].phoneNumber"))
}
