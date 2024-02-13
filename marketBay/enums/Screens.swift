//
//  Screens.swift
//  marketBay
//
//  Created by EmJhey PB on 2/8/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    @Published var currentRoot: Screens = .dashboardView
    
    var rootScreens : [(String, Screens, String)] = [
        ("Login", .loginView, "lock.fill"),
        ("Dashboard", .dashboardView, "house.fill"),
        ("Marketplace", .marketplaceView, "basket.fill"),
        ("My Posts", .myPostsView, "tag.fill"),
        ("Favorites", .favoritesView, "star.fill"),
        ("Profile", .profileView, "person.fill")
    ]
}

enum Screens {
    case dashboardView
    case loginView
    case registrationView
    case favoritesView
    case myPostsView
    case profileView
    case marketplaceView
}
