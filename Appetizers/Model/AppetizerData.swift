//
//  AppetizerData.swift
//  Appetizers
//
//  Created by Diana Duong on 12/10/23.
//

import Foundation

struct AppetizerData: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


//decode the request into an array of appetizers
//create a response object

//helper struct

struct AppetizerResponse: Decodable {
    let request: [AppetizerData]
}

struct MockData {
    
    //mock data to populate the UI before implementing network calls
    static let sampleAppetizer = AppetizerData(id: 01,
                                                name: "Test Appetizer",
                                                description: "This is the description for my appetizer. It's yummy.",
                                                price: 9.99,
                                                imageURL: "asian-flank-steak",
                                                calories: 700,
                                                protein: 13,
                                                carbs: 11)
    
    
    //sample array of appetizers
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
