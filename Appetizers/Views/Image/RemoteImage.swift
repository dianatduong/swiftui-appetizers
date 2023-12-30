//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Diana Duong on 12/29/23.
//

import SwiftUI

//conforms to OO because we want to monitor & broadcast the image
final class ImageLoader: ObservableObject {
    
    //downloads image & then broadcasts the chnages via @Published
    //image is initially set to nil & allows for dynamic changes
    @Published var image: Image? = nil
    
    
    //1. network call to download the image
    func load(fromURLString urlString: String) {
        
        //completion = a UIimage
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            
            //unwrap the optioal / handle nil case by showing placeholders - no error handling
            guard let uiImage = uiImage else { return }
            
            //update of the image is completed on the main thread
            DispatchQueue.main.async {
                //set the swiftui image to the uiimage
                self.image = Image(uiImage: uiImage) //this will trigger a UI change once downloaded
            }
            
        }
    }
}
    
    //2.
struct RemoteImage: View {
    
    //optional to ensure there is an image
    var image: Image?
    
    var body: some View {
        
        //if we have an image - lets return it otherwise return the placeholder image
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}
    

//see the broadcasted change of an image and changes the view. refreshes with new image or use image placeholder
struct AppetizerRemoteImage: View {
    
    //creating a new imageLoader view model
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        
        RemoteImage(image: imageLoader.image)
        
            //when the iamge appears on the screen - we call imageLoader.load which will make a network call
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}
