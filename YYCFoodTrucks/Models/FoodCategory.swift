//
//  FoodCategory.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import Foundation

class FoodCategory: Identifiable, Codable {
    var name: String
    var id: Int
    var img: String
    
    init(name: String, id: Int, img: String) {
        self.name = name
        self.id = id
        self.img = img
    }
}

let categories = [
    FoodCategory(name: "Sweet Treats", id: 0, img: "SweetTreats"),
    FoodCategory(name: "Pizza", id: 1, img: "Pizza"),
    FoodCategory(name: "Backyard Faves", id: 2, img: "Backyard"),
    FoodCategory(name: "Asian Fusion", id: 3, img: "AsianFusion"),
    FoodCategory(name: "Home Cookin\'", id: 4, img: "HomeCooking"),
    FoodCategory(name: "International", id: 5, img: "International")
]
