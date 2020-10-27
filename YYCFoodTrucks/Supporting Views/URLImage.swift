//
//  URLImage.swift
//  LoadingImages
//
//  Created by Mohammad Azam on 6/20/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//
import Foundation
import SwiftUI

struct URLImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    var placeholder: Image
    var resizable: Bool
    
    init(url: String, placeholder: Image = Image(systemName: "photo"), resizable: Bool = false) {
        self.placeholder = placeholder
        self.resizable = resizable
        self.imageLoader.load(url: url)
    }
    
    var body: Image {
        if resizable{
            return img.resizable()
        } else {
            return img
        }
    }
    
    var img: Image {
       if let uiImage = self.imageLoader.downloadedImage {
           return Image(uiImage: uiImage)
               .renderingMode(.original)
       } else {
           return placeholder
       }
    }
    
}
