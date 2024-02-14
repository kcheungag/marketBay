//
//  ListingView.swift
//  marketBay
//  Subsequent View when click listings on Home Screen (MarketplaceView), show details of the listing
//  display all item details and a contact button to initiate communication with seller
//  Created by Cheung K on 12/2/2024.
//

import SwiftUI

struct ListingView: View {
    var body: some View {
        VStack {
            // Menu Bar
            CustomBackFragment()
            
            ScrollView {
                VStack {
                    // Image
                    Image(systemName: "photo") // Placeholder image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    // Image Shortcut Gallery (if applicable)
                    // Add your implementation here
                    
                    // Title
                    Text("Listing Title")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    // Seller Info
                    HStack {
                        Image(systemName: "person.circle") // Placeholder avatar
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text("Seller Name") // Placeholder seller name
                                .font(.headline)
                            // Add more seller info (e.g., rating, location) if applicable
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Action to initiate message with seller
                        }) {
                            Text("Message")
                        }
                    }
                    .padding()
                    
                    // Price Info
                    Text("Price: $100") // Placeholder price
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(.vertical)
                    
                    // Buy Now Button (if applicable)
                    // Add your implementation here
                    
                    // Add to Favorites Button
                    Button(action: {
                        // Action to add listing to favorites
                    }) {
                        Text("Add to Favorites")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .padding(.horizontal)
            }
        }
    }
}


#Preview {
    ListingView()
}
