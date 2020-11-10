//
//  FirebaseAnnotationImage.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-11-09.
//

import Foundation
import SwiftUI


struct FirebaseAnnotationImage: UIViewRepresentable{
    
    @ObservedObject var imageLoader : Loader
    
    
    init(id: String){
        self.imageLoader = Loader(id)
    }
    
    var image: UIImage?{
        imageLoader.data.flatMap(UIImage.init)
    }

    
    func makeUIView(context: Context) -> some UIView {
    
        let img = UIImageView(image: image)
        return img
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
    
    
}
