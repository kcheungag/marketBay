//
//  DashboardView.swift
//  marketBay
//  Have access points to ProfileView, FavoritesView, MyPostsView, 
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @EnvironmentObject var dataAccess: DataAccess
    
    var body: some View {
        NavigationStack {
            VStack {
            //MenuTemplate().environmentObject(dataAccess)
                // Title "You"
                Text("Dashboard")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Profile Info
                HStack {
                    Image(systemName: "person.circle") // Placeholder avatar
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text("User Name") // Placeholder user name
                            .font(.headline)
                        
                        Button {
                            appRootManager.currentRoot = .profileView
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                
                // ListView Layout
                VStack {
                    DashboardItemView(icon: "star.fill", title: "Favorites")
                    DashboardItemView(icon: "doc.plaintext.fill", title: "Current Listings")
                    DashboardItemView(icon: "plus.circle.fill", title: "Add a Listing")
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

struct DashboardItemView: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.headline)
            
            Spacer()
        }
        .padding(.vertical)
    }
}


#Preview {
    DashboardView()
}
