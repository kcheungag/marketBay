//
//  DataAccess.swift
//  marketBay
//
//  Created by EmJhey PB on 2/13/24.
//

import Foundation

final class DataAccess: ObservableObject {
    @Published var loggedInUser: User? = nil
    
    // MARK: Log User In
    func login(user: User) {
        do {
            let encodedData = try JSONEncoder().encode(user)
            
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsEnum.loggedInUser.rawValue)
            loggedInUser = user
        } catch {
            print("Failed to encode User to Data")
        }
    }
    
    // MARK: Check Logged In User Exists
    func getLoggedInUser() -> User? {
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsEnum.loggedInUser.rawValue) as? Data {
            do{
                return try JSONDecoder().decode(User.self, from: savedData)
            } catch {
                print("Failed to convert Data to User")
            }
        }
        
        return nil
    }
    
    // MARK: Logout
    func logout() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsEnum.loggedInUser.rawValue)
        loggedInUser = nil
    }
    
    // MARK: Access Posts
    func getPosts(idFilter: Int?) -> [Listing] {
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsEnum.posts.rawValue) as? Data {
            do {
                let decodedListings = try JSONDecoder().decode([Listing].self, from: savedData)
                print("Decoded listings: \(decodedListings)")
                return decodedListings
            } catch {
                print("Failed to decode data: \(error)")
            }

        }
        
        return []
    }
    
    // MARK: Save Post
    func savePosts(post: Listing) {
        do {
            var savedPosts = getPosts(idFilter: nil)
            savedPosts.append(post)
            let encodedData = try JSONEncoder().encode(savedPosts)
            
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsEnum.posts.rawValue)
        } catch {
            print("Failed to encode Listings to Data")
        }
    }
    
    // MARK: Toggle Favorite Listing
       func toggleFavorite(for user: User, listing: Listing) {
           if let index = user.favorites.firstIndex(where: { $0.id == listing.id }) {
                      user.favorites.remove(at: index)
                  } else {
               user.favorites.append(listing)
           }
           saveUser(user)
       }
    
    // MARK: Save User
       private func saveUser(_ user: User) {
           do {
               let encodedData = try JSONEncoder().encode(user)
               UserDefaults.standard.set(encodedData, forKey: UserDefaultsEnum.loggedInUser.rawValue)
               loggedInUser = user
           } catch {
               print("Failed to encode User to Data")
           }
       }

}
