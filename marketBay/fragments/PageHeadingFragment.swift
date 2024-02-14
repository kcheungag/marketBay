//
//  PageHeadingFragment.swift
//  marketBay
//
//  Created by EmJhey PB on 2/14/24.
//

import SwiftUI

struct PageHeadingFragment: View {
    var pageTitle: String
    
    var body: some View {
        Text(pageTitle)
            .font(.title)
            .fontWeight(.bold)
            .padding([.top, .bottom])
    }
}

#Preview {
    PageHeadingFragment(pageTitle: "Title")
}
