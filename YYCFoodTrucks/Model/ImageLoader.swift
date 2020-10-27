//
//  ImageLoader.swift
//  LoadingImages
//
//  Created by Mohammad Azam on 6/20/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//
import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var downloadedImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    print("Downloading image")
                     self.didChange.send(nil)
                }
                return
            }
            
            self.downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                print(data)
                print(error)
                print(response)
                print("Downloaded image")
                self.didChange.send(self)
            }
            
        }.resume()
        
    }
    
    
}
