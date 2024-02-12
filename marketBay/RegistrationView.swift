//
//  RegistrationView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss)  var dismiss
    
    @State private var emailFromUI : String = ""
    @State private var nameFromUI : String = ""
    @State private var passwordFromUI : String = ""
    @State private var phoneNumberFromUI : String = ""
    @State private var errorMessage : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Spacer()
            Text("Name")
            TextField("Enter name", text: self.$nameFromUI)
                .autocorrectionDisabled(true)
                .autocapitalization(.words)
                .keyboardType(.alphabet)
            Text("Email")
            TextField("Enter email address", text: self.$emailFromUI)
                .autocorrectionDisabled(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .keyboardType(.emailAddress)
            Text("Password")
            SecureField("Enter password", text: self.$passwordFromUI)
                .autocorrectionDisabled(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            Text("Phone Number")
            TextField("Enter phone number", text: self.$phoneNumberFromUI)
                .autocorrectionDisabled(true)
                .autocapitalization(.words)
                .keyboardType(.alphabet)
            Spacer()
            HStack{
                Spacer()
                Text(self.errorMessage)
                    .padding(self.errorMessage.isEmpty ? 0.0 : 5.0)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(.red)
                    .font(.title3)
                    .cornerRadius(10.0)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Button {
                    validateRegistration()
                }label: {
                    Text("R E G I S T E R")
                }
                Spacer()
            }
        }
        .padding()
        .navigationTitle("REGISTRATION")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func validateRegistration(){
        if self.nameFromUI.isEmpty || self.emailFromUI.isEmpty || self.passwordFromUI.isEmpty || self.phoneNumberFromUI.isEmpty {
            self.errorMessage = "Please fill in all the fields to register"
        }
    }
}

#Preview {
    RegistrationView()
}
