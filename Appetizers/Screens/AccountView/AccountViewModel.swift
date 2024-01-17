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
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else { return false } //if fail
        
        return true //if pass
    }
    
}
