//
//  AddPostsView.swift
//  marketBay
//
//  Created by Cheung K on 12/2/2024.
//

import SwiftUI

struct CreatePostView: View {
    @EnvironmentObject var dataAccess: DataAccess
    
    // MARK: Input Variables
    @State private var titleIn: String = ""
    @State private var descriptionIn: String = ""
    @State private var categoryIn: String = ""
    @State private var priceIn: String = ""
    
    // MARK: Output Variables
    
    var body: some View {
        VStack {
//            BackMenuFragment()
            PageHeadingFragment(pageTitle: "New Post")
        
            // MARK: Post Details
//                let id: Int
            TextboxFragment(fieldName: "Title", placeholder: "Title", binding: $titleIn)
            
            Text("Product Details")
                .font(.title2)
                .fontWeight(.bold)
                .padding([.top,.bottom], 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextboxFragment(fieldName: "Category", placeholder: "Category", binding: $categoryIn)
            TextboxFragment(fieldName: "Price", placeholder: "Price", binding: $priceIn, keyboardType: .decimalPad)
            MultilineTextboxFragment(fieldName: "Description", placeholder: "Description", binding: $descriptionIn)
            Spacer()
            
            Button {
               ConfirmPostView(listing: Listing(id: 1, title: "Unlock! A Noside Story", description: "Secret Adventures: Part 1", category: "Toys", price: 25.0, seller: User(id: 1, name: "MJ", email: "mb", password: "mb", phoneNumber: "123"), email: "users[0].email", phoneNumber: "users[0].phoneNumber"))
            }label: {
                Text("View Sample Post")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    func resetFields() {
        titleIn = ""
        descriptionIn = ""
        categoryIn = ""
        priceIn = ""
    }
}

#Preview {
    CreatePostView()
}
