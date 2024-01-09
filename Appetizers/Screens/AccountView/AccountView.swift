//
//  AccountView.swift
//  Appetizers
//
//  Created by Diana Duong on 12/10/23.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthdate = Date()


    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text:  $lastName)
                        TextField("Email", text:  $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .disableAutocorrection(true)
                        DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    }
                    
                    Section(header: Text("Requests")) {
                        Text("Extra Napkins")
                        Text("Frequent Refils")
                    }
                }
            }
            
            
            .navigationTitle("🐙 My Account")
        }

    }
}

#Preview {
    AccountView()
}

