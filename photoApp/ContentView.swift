//
//  ContentView.swift
//  photoApp
//
//  Created by scholar on 5/17/23.💚
//

import SwiftUI

struct ContentView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?

    
    var body: some View {
        
        VStack{
                        
            Image(uiImage: selectedImage ?? UIImage(named: "heartCamera")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack(spacing: 50) {
                Button("Select a Photo") {
                    self.sourceType = .photoLibrary
                    isImagePickerShowing = true
                    
                }
                Button("Take a Photo") {
                    self.sourceType = .camera
                    isImagePickerShowing = true
                    
                }
            }
            
        }
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
