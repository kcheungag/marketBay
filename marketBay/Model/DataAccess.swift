//
//  DataAccess.swift
//  marketBay
//
//  Created by EmJhey PB on 2/13/24.
//

import Foundation

final class DataAccess: ObservableObject {
    @Published var loggedInUser: User? = nil
    @Published var loggedInUserPostings: [Listing] = []
    
    // MARK: Log User In
    func login(user: User) {
        do {
            let encodedData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsEnum.loggedInUser.rawValue)
            loggedInUser = user
            loggedInUserPostings = getPosts(idFilter: user.id).sorted(by: { $0.id > $1.id })
        } catch {
            print("Failed to encode User to Data")
        }
    }
    
    // MARK: Check Logged In User Exists
    func getLoggedInUser() -> User? {
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsEnum.loggedInUser.rawValue) as? Data {
            do{
                let currentUser = try JSONDecoder().decode(User.self, from: savedData)
                loggedInUserPostings = getPosts(idFilter: currentUser.id).sorted(by: { $0.id > $1.id })
                return currentUser
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
            do{
                let currentListings = try JSONDecoder().decode([Listing].self, from: savedData)
                return idFilter == nil ? currentListings : currentListings.filter{$0.seller.id == idFilter}
            } catch {
                print("Failed to convert Data to Listing")
            }
        }
        
        return []
    }
    
    // MARK: Save Post
    func savePosts(post: Listing) {
        do {
            var currentPost = post
            var savedPosts = getPosts(idFilter: nil)
            currentPost.id = savedPosts.count + 1
            savedPosts.append(currentPost)
            let encodedData = try JSONEncoder().encode(savedPosts)
            
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsEnum.posts.rawValue)
            loggedInUserPostings = getPosts(idFilter: currentPost.seller.id).sorted(by: { $0.id > $1.id })
        } catch {
            print("Failed to encode Listings to Data")
        }
    }
}
