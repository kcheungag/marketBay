//
//  RegistrationView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss)  var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                dismiss()
            }label: {
                Text("R E G I S T E R")
            }
        }
        .padding()
        .navigationTitle("REGISTRATION")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RegistrationView()
}
