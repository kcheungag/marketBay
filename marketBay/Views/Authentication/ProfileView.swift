//
//  ProfileView.swift
//  marketBay
//  For View and Edit User Credentials
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @EnvironmentObject var dataAccess: DataAccess
    
    var body: some View {
        NavigationStack {
            // Menu Bar
            MenuTemplate().environmentObject(dataAccess)
            VStack {
                Text("PROFILE")
            }
        }
        .padding()
        .navigationBarTitle("PROFILE")
    }
}

#Preview {
    ProfileView()
}
