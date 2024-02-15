//
//  ProfileView.swift
//  marketBay
//  For View and Edit User Credentials
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var dataAccess: DataAccess
    
    @State private var loggedInUser: User?
    @State private var emailFromUI : String = ""
    @State private var nameFromUI : String = ""
    @State private var passwordFromUI : String = ""
    @State private var phoneNumberFromUI : String = ""
    @State private var errorMessage : String = ""
    
    var body: some View {
        VStack {
            Text(self.emailFromUI)
            TextField("Name", text: self.$nameFromUI)
        }
        .onAppear(){
            loggedInUser = dataAccess.getLoggedInUser()
            emailFromUI = loggedInUser?.email ?? ""
            nameFromUI = loggedInUser?.name ?? ""
            passwordFromUI = loggedInUser?.password ?? ""
            phoneNumberFromUI = loggedInUser?.phoneNumber ?? ""
        }
    }
}

#Preview {
    ProfileView()
}
