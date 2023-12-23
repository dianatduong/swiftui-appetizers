//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Diana Duong on 12/15/23.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: AppetizerData
    
    var body: some View {
        HStack {
            // Asynchronously load the image from the URL
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                // Placeholder while the image is loading (you can customize this)
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$ \(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}


#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
