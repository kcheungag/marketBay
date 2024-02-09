//
//  LoginView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss)  var dismiss
    @State private var emailFromUI : String = ""
    @State private var passwordFromUI : String = ""
    @State private var rememberUser : Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0){
            Text("Email")
            TextField("Enter email address", text: self.$emailFromUI)
                .autocorrectionDisabled(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .keyboardType(.emailAddress)
            Text("Password")
            SecureField("Enter password", text: self.$passwordFromUI)
                .autocorrectionDisabled(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            Toggle(isOn: self.$rememberUser){
                Text("Remember Me")
            }
            Spacer()
            HStack{
                Spacer()
                Button {
                    dismiss()
                }label: {
                    Text("L O G I N")
                }
                Spacer()
            }
            NavigationLink {
                RegistrationView()
            }label: {
                Text("R E G I S T E R")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
        .navigationTitle(Text("LOGIN"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LoginView()
}
