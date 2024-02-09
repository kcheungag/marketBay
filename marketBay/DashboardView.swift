//
//  DashboardView.swift
//  marketBay
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            MenuTemplate()
            VStack {
                Text("DASHBOARD")
                Spacer()
            }
        }
    }
}

#Preview {
    DashboardView()
}
