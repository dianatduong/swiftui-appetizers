//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Diana Duong on 1/1/24.
//


import SwiftUI

struct AppetizerDetailView: View {
    
    var appetizer: AppetizerData
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5) {
                        Text("Carb")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.carbs)g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.carbs)g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                } // end HStack
            }
            
            Spacer()
            
            Button(action: {
                print("button tapped")
            }) {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
                }
            
            .padding(.bottom, 30)
        } // end VStack app details
        
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            //when ontap - we are switching the isSHowingDetail to fale (hiding the detailsView)
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    } // end VStack app image
} // end struct


struct AppetizerDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                            isShowingDetail: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}



