//
//  MarketplaceView.swift
//  marketBay
//  Home Screen of App for browsing listings
//  Have access points to DashboardView and ListingView,
//  Created by Cheung K on 12/2/2024.
//

import SwiftUI

struct MarketplaceView: View {
    @State private var selectedCategory: String = "All"
    @EnvironmentObject var dataAccess: DataAccess
    
    var categories = ["All", "Auto", "Furniture", "Electronics", "Women's Clothing", "Men's Clothing"]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Menu Bar （Error)
                MenuTemplate().environmentObject(dataAccess)
                
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
                                    Text(category)
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
                        ForEach(1..<21) { index in
                            // Display each item in a grid
                            ItemView()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
        .onAppear() {
            loadDummyData()
            dataAccess.isLoggedIn = dataAccess.getLoggedInUser() != nil
        }
    }
    
    func loadDummyData() {
        let posts = dataAccess.getPosts(idFilter: nil)
        
        if(posts.isEmpty) {
            // MARK: Dummy Users
            let users = [
                User(id: 1, name: "MJ", email: "mb", password: "mb", phoneNumber: "123"),
                User(id: 2, name: "Dayeeta", email: "dg", password: "dg", phoneNumber: "456"),
                User(id: 3, name: "Gordon", email: "kc", password: "kc", phoneNumber: "789"),
            ]
            
            // MARK: Dummy Seller Posts
            let posts = [
                Listing(id: 1, title: "Unlock! A Noside Story", description: "Secret Adventures: Part 1", category: "Toys", price: 25.0, seller: users[0], email: users[0].email, phoneNumber: users[0].phoneNumber),
                Listing(id: 2, title: "Unlock! Tombstone Express", description: "Secret Adventures: Part 2", category: "Toys", price: 25.0, seller: users[1], email: users[1].email, phoneNumber: users[1].phoneNumber),
                Listing(id: 3, title: "Unlock! The Adventures of Oz", description: "Secret Adventures: Part 3", category: "Toys", price: 25.0, seller: users[2], email: users[2].email, phoneNumber: users[2].phoneNumber),
            ]
            
            users[0].addListing(posts[0])
            users[1].addListing(posts[1])
            users[2].addListing(posts[2])
        }
    }

}

struct ItemView: View {
    var body: some View {
        VStack {
            // Image and Title
            Image(systemName: "photo") // Placeholder image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text("Item Title")
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            // Price
            Text("$100")
                .font(.subheadline)
                .foregroundColor(.green)
                .padding(.vertical, 5)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}


#Preview {
    MarketplaceView()
}
