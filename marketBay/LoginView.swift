//
//  LoginView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss)  var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                dismiss()
            }label: {
                Text("L O G I N")
            }
            
            NavigationLink {
                RegistrationView()
            }label: {
                Text("R E G I S T E R")
            }
        }
        .padding()
        .navigationTitle("LOGIN")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
