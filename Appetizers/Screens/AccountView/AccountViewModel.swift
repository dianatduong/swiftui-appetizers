//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Diana Duong on 1/14/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    
    @Published var extraNapkin = false
    @Published var frequentRefills = false
    
    @Published var alertItem: AlertItem?
   
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            
            //alert
            alertItem = AlertContext.invalidForm
            
            //if any of these fields are empty
            return false
        }
        
        //check to see if email is valid
        guard email.isValidEmail else {
            
            //alert
            alertItem = AlertContext.invalidEmail
            
            return false
        }
        
        return true //if pass
    }
    
}
