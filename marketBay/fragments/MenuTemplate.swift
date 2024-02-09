//
//  Menu.swift
//  marketBay
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct MenuTemplate: View {
    @State private var selectedScreen: Screens? = nil
    
    var body: some View {
        VStack {
            NavigationLink(destination: LoginView(), tag: Screens.loginView, selection: self.$selectedScreen) {
            }
            
            NavigationLink(destination: MyPostsView(), tag: Screens.myPostsView, selection: self.$selectedScreen) {
            }
            
            NavigationLink(destination: FavoritesView(), tag: Screens.favoritesView, selection: self.$selectedScreen) {
            }
            
            NavigationLink(destination: ProfileView(), tag: Screens.profileView, selection: self.$selectedScreen) {
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button{
                        selectedScreen = .loginView
                    } label: {
                        Image(systemName: "lock.circle.fill")
                        Text("Login")
                    }
                    
                    Button{
                        selectedScreen = .myPostsView
                    } label: {
                        Image(systemName: "tag.circle.fill")
                        Text("My Posts")
                    }
                    
                    Button{
                        selectedScreen = .favoritesView
                    } label:{
                        Text("Favorites")
                        Image(systemName: "star.circle.fill")
                    }
                    
                    Button{
                        selectedScreen = .profileView
                    } label:{
                        Text("Profile")
                        Image(systemName: "person.crop.circle.fill")
                    }
                    
                    Button{
                    } label:{
                        Text("Logout")
                        Image(systemName: "power.circle.fill")
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(Color(.black))
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    MenuTemplate()
}
