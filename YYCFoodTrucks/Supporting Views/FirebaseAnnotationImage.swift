//
//  FirebaseAnnotationImage.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-11-09.
//

import Foundation
import SwiftUI


struct FirebaseAnnotationImage: UIViewRepresentable{
    
    @ObservedObject var imageLoader: Loader
    var id: String
    
    func makeUIView(context: Context) -> UIImageView {
        
        return UIImageView()
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        self.imageLoader = Loader(id)
        
        
        UIImageView.
    }
}
