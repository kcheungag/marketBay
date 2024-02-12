//
//  User.swift
//  marketBay
//
//  Created by Cheung K on 12/2/2024.
//

import Foundation

class User {
    let id: Int
    var name: String
    var email: String
    var phoneNumber: String
    var listings: [Listing] //for seller to manage listings
    var favorites: [Listing] //for favorites list

    init(id: Int, name: String, email: String, phoneNumber: String) {
        self.id = id
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.listings = []
        self.favorites = []
        
        // Load user's data from UserDefaults
        loadUserData()
    }

    // Function to add a new listing
    func addListing(_ listing: Listing) {
        listings.append(listing)
        saveUserData()
    }

    // Function to add a listing to favorites
    func addToFavorites(_ listing: Listing) {
        favorites.append(listing)
        saveUserData()
    }
    
    // Function to save user data to UserDefaults
    private func saveUserData() {
           let userData: [String: Any] = [
               "id": id,
               "name": name,
               "email": email,
               "phoneNumber": phoneNumber,
               "listings": listings.map { $0.id }, // Save only listing IDs
               "favorites": favorites.map { $0.id } // Save only favorite listing IDs
           ]

           UserDefaults.standard.set(userData, forKey: "userData")
    }

    // Function to load user data from UserDefaults
    private func loadUserData() {
        guard let userData = UserDefaults.standard.dictionary(forKey: "userData"),
              let listingsIDs = userData["listings"] as? [Int],
              let favoritesIDs = userData["favorites"] as? [Int] else {
            return
        }
        
        // Load listings from IDs
        self.listings = listingsIDs.compactMap { id in
            // Fetch listing from data source using ID
            return nil // Placeholder for demo, replace with actual logic
        }
        
        // Load favorites from IDs
        self.favorites = favoritesIDs.compactMap { id in
            // Fetch listing from data source using ID
            return nil // Placeholder for demo, replace with actual logic
        }
    }
    

    // Function to retrieve listings of the user
    func getListings() -> [Listing] {
        // Logic to fetch listings associated with this user
        return listings // Placeholder
    }

    // Function to retrieve favorites of the user
    func getFavorites() -> [Listing] {
        // Logic to fetch favorites associated with this user
        return favorites // Placeholder
    }
}
