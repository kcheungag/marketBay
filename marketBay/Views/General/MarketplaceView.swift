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
    
    var categories = ["All", "Auto", "Furniture", "Electronics", "Women's Clothing", "Men's Clothing"]
    
    var body: some View {
        VStack {
            // Menu Bar （Error)
            // MenuTemplate()
            
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
