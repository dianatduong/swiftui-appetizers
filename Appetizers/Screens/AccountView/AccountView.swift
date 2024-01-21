//
//  AccountView.swift
//  Appetizers
//
//  Created by Diana Duong on 12/10/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First Name", text: $viewModel.firstName)
                        TextField("Last Name", text:  $viewModel.lastName)
                        TextField("Email", text:  $viewModel.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .disableAutocorrection(true)
                        DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                        
                        Button {
                            //func to check if form is valid
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                    }
                    
                    Section(header: Text("Requests")) {
                        Toggle("Extra Napkins", isOn: $viewModel.extraNapkin)
                        Toggle("Frequent Refils", isOn: $viewModel.frequentRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                }
            }
            .navigationTitle("🐙 My Account")
        }
        
        //implementing the alerts for the form fields
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, 
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}

