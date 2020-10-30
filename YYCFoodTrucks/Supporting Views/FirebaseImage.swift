//
//  FirebaseImage.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-27.
//

import SwiftUI
//let placeholder = UIImage(named: "placeholder.jpg")!
//let placeholder =  UIImage(systemName: "photo")!
let placeholder = UIImage(named: "Loading")!
let primColor2 = Color(red: 0, green: 0.73, blue: 0.6, opacity: 0.1)

struct FirebaseImage : View {
    var width: CGFloat
    var height: CGFloat
    
    
    init(id: String, width: Int, height: Int) {
        self.width = CGFloat(width)
        self.height = CGFloat(height)
        self.imageLoader = Loader(id)
    }

    @ObservedObject private var imageLoader : Loader
    
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }

    var body: some View {
        Group{
            if image != nil {
                Image(uiImage: image ?? placeholder)
                .resizable()
                    .frame(width: self.width, height: self.height)
                    .animation(.easeIn)
            } else {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: self.width, height: self.height)
            }
        }
    }
}
