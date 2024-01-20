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
        
        //check to see if these fields are empty
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            //alert for invalid Form
            alertItem = AlertContext.invalidForm
            //if any of these fields are empty
            return false
        }
        
        //check to see if email is valid
        guard email.isValidEmail else {
            //alert for invalid Email
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true //if pass
    }
    
}
