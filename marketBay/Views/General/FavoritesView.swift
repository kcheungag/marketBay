//
//  FavoritesView.swift
//  marketBay
//  For View and Edit Favorite list
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var showAllItems = true // Toggle between "All Items" and "Collections"
    @State private var showCreateCollection = false
    @State private var newCollectionName = ""
    
    var body: some View {
        VStack {
            // Back Button and Title
            HStack {
                Button(action: {
                    // Action to go back
                }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }
                Spacer()
                Text("Favorites")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                Spacer()
            }
            .padding()
            
            // Buttons: All Items and Collections
            HStack {
                Button(action: {
                    showAllItems = true
                }) {
                    Text("All Items")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(showAllItems ? .white : .blue)
                        .background(showAllItems ? Color.blue : Color.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                
                Button(action: {
                    showAllItems = false
                }) {
                    Text("Collections")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(!showAllItems ? .white : .blue)
                        .background(!showAllItems ? Color.blue : Color.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
            }
            .padding()
            
            // Favorites List or Collections Grid
            if showAllItems {
                // List of all items
                FavoritesListView()
            } else {
                // Grid of collections
                CollectionsGridView()
            }
            
            // Create Collection Button
            Button(action: {
                showCreateCollection = true
            }) {
                Text("Create a Collection")
                    .padding()
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $showCreateCollection) {
                CreateCollectionView(isPresented: $showCreateCollection, collectionName: $newCollectionName)
            }
            
            Spacer()
        }
    }
}

struct FavoritesListView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { index in
                    // Example of a row in the list view
                    FavoriteListItemView()
                        .padding(.vertical, 8)
                }
            }
            .padding()
        }
    }
}

struct FavoriteListItemView: View {
    var body: some View {
        HStack {
            // Image, Title, Price
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text("Listing Title")
                Text("Price")
            }
            Spacer()
            
            // Add and Remove Icon Buttons
            Button(action: {
                // Action to add item to collection
            }) {
                Image(systemName: "plus.circle")
            }
            Button(action: {
                // Action to remove item from favorites
            }) {
                Image(systemName: "minus.circle")
            }
        }
    }
}

struct CollectionsGridView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(0..<6) { index in
                    // Example of a grid item in the collections grid view
                    CollectionGridViewItem()
                }
            }
            .padding()
        }
    }
}

struct CollectionGridViewItem: View {
    var body: some View {
        VStack {
            // Collection Image
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            // Collection Title
            Text("Collection Name")
        }
    }
}

struct CreateCollectionView: View {
    @Binding var isPresented: Bool
    @Binding var collectionName: String
    
    var body: some View {
        NavigationView {
            VStack {
                // Navigation Bar
                HStack {
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Text("New Collection")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {
                        // Action to create collection
                        isPresented = false
                    }) {
                        Text("Create")
                    }
                }
                .padding()
                
                // Collection Name TextField
                TextField("Enter Collection Name", text: $collectionName)
                    .padding()
                
                Spacer()
            }
        }
    }
}


#Preview {
    FavoritesView()
}
