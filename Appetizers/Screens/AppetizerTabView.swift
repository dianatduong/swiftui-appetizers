//
//  ContentView.swift
//  Appetizers
//
//  Created by Diana Duong on 12/10/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        
        TabView {
            
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(.primaryColor)

    }
}

#Preview {
    AppetizerTabView()
}
