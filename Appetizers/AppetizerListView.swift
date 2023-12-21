//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Diana Duong on 12/10/23.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        
        NavigationView {
            
            List(MockData.appetizers) { appetizer in
               AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
