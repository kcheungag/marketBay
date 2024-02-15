//
//  MarketplaceView.swift
//  marketBay
//  Home Screen of App for browsing listings
//  Have access points to DashboardView and ListingView,
//  Created by Cheung K on 12/2/2024.
//

import SwiftUI

struct MarketplaceView: View {
    @State private var selectedCategory: Category = .all
    @EnvironmentObject var dataAccess: DataAccess
    @State private var listings: [Listing] = []   // Property to hold the listings
    
    let categories: [Category] = [.all, .auto, .furniture, .electronics, .womensClothing, .mensClothing, .toys, .homeAndGarden]

    var body: some View {
        NavigationStack {
            VStack {
                // Menu Bar （Error)
                //MenuTemplate().environmentObject(dataAccess)
                
                // Horizontal Category Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                VStack {
                                    Image(systemName: "circle.fill") // Placeholder image
                                        .foregroundColor(category == selectedCategory ? .blue : .gray)
                                    Text(category.rawValue) // Access the rawValue
                                        .font(.caption)
                                        .foregroundColor(category == selectedCategory ? .blue : .black)
                                }
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                }
                .padding(.vertical)
                
                // Grid-like Display of Items
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                        ForEach(listings) { listing in
                            // Display each item in a grid
                            ItemView(listing: listing)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
        .onAppear() {
            loadDummyData()
            //dataAccess.loggedInUser = dataAccess.getLoggedInUser()
        }
    }
    
    func loadDummyData() {
        print("Loading dummy data...")

        let posts = dataAccess.getPosts(idFilter: nil)
        
        if(posts.isEmpty) {
            // MARK: Dummy Users
            let users = [
                User(id: 1, name: "MJ", email: "mb", password: "mb", phoneNumber: "123"),
                User(id: 2, name: "Dayeeta", email: "dg", password: "dg", phoneNumber: "456"),
                User(id: 3, name: "Gordon", email: "kc", password: "kc", phoneNumber: "789"),
            ]
            
            // MARK: Dummy Seller Posts
            let listings = [
                       Listing(id: 1, title: "Unlock! A Noside Story", description: "Secret Adventures: Part 1", category: .toys, price: 25.0, seller: users[0], email: users[0].email, phoneNumber: users[0].phoneNumber),
                       Listing(id: 2, title: "Unlock! Tombstone Express", description: "Secret Adventures: Part 2", category: .toys, price: 25.0, seller: users[1], email: users[1].email, phoneNumber: users[1].phoneNumber),
                       Listing(id: 3, title: "Unlock! The Adventures of Oz", description: "Secret Adventures: Part 3", category: .toys, price: 25.0, seller: users[2], email: users[2].email, phoneNumber: users[2].phoneNumber),
                       // Add more sample listings here
                   ]
            
            // Assign listings to the listings array
            self.listings = listings
            
            for listing in listings {
                       dataAccess.savePosts(post: listing)
                   }
            
            for user in users {
                        for listing in listings {
                            user.addListing(listing)
                        }
                    }
        }
    }

}

struct ItemView: View {
    let listing: Listing // Add a property to hold the listing information

    var body: some View {
        VStack {
            // Image and Title
            Image(systemName: "photo") // Placeholder image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text(listing.title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            // Price
            Text("$\(String(format:"%.2f", listing.price))")
                .font(.subheadline)
                .foregroundColor(.green)
                .padding(.vertical, 5)
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}


#Preview {
    let dataAccess = DataAccess() // Create a mock DataAccess object
    dataAccess.loggedInUser = User(id: 1, name: "John Doe", email: "john@example.com", password: "password", phoneNumber: "123456789")

    return MarketplaceView().environmentObject(dataAccess)
}
