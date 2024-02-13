//
//  BackMenuFragment.swift
//  marketBay
//
//  Created by EmJhey PB on 2/13/24.
//

import SwiftUI

struct BackMenuFragment: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @Environment(\.dismiss)  var dismiss
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label:{
                Image(systemName: "chevron.backward")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                Image(.marketBay)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125)
            }
            
            Spacer()
            
            Menu {
                let rootScreens = appRootManager.rootScreens
                ForEach(rootScreens.indices) { index in
                    if(appRootManager.currentRoot != rootScreens[index].1) {
                        Button {
                            appRootManager.currentRoot = rootScreens[index].1
                        } label: {
                            Text(rootScreens[index].0)
                            Image(systemName: rootScreens[index].2)
                        }
                    }
                }
                
                Button (role:.destructive) {
                    appRootManager.currentRoot = .dashboardView
                } label:{
                    Text("Logout")
                    Image(systemName: "power")
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    BackMenuFragment()
}
