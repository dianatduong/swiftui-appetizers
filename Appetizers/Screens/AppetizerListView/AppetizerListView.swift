//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Diana Duong on 12/10/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    //initalizing the view model
    @StateObject var viewModel = AppetizerListViewModel()
    
    //detail view is hidden on default
    @State private var isShowingDetail = false
    
    
    var body: some View {
        
        ZStack {
            //bottom stack/view
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                   AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            // blur when true
            .blur(radius: isShowingDetail ? 20 : 0)
            .scrollDisabled(isShowingDetail)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                                    isShowingDetail: $isShowingDetail)
            }
            
            //top view  - only when loading
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
