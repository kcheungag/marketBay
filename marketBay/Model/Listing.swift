//
//  Listing.swift
//  marketBay
//
//  Created by Cheung K on 12/2/2024.
//

import Foundation

struct Listing {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let sellerID: Int // Seller's ID
    
    // Function to retrieve seller's information
       func getSeller() -> User? {
           // Logic to fetch the user with the sellerID
           return nil // Placeholder for demo, replace with actual logic
       }
}
