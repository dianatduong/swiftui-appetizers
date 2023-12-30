//
//  LoadingView.swift
//  Appetizers
//
//  Created by Diana Duong on 12/26/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        //initialized with style for the size of the indicator
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        
        //color of the indicator
        activityIndicatorView.color = .primaryColor
        
        //starts animating on creation
        activityIndicatorView.startAnimating()
        
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}


struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ActivityIndicator()
        }
    }
}
