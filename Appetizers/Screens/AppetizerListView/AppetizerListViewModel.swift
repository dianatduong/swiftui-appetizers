//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Diana Duong on 12/21/23.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [AppetizerData] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    //detail view is hidden on default
    @Published var isShowingDetail = false
    
    //which appetizer was selcted - optional because no data to start
    @Published var selectedAppetizer: AppetizerData?
    
    func getAppetizers() {
        isLoading = true //start laoding
        
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false // done loading

                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    //print(error.localizedDescription)
                    switch error {
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
