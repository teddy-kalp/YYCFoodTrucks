//
//  Global.swift
//  YYCFoodTrucks
//
//  Created by Teddy Kalp on 2020-10-29.
//

import Foundation
import SwiftUI

// used for the primary colors of our applications
let primColor = Color(red: 0, green: 0.73, blue: 0.6, opacity: 1)
let primColorUI = UIColor(red: 0, green: 0.73, blue: 0.6, alpha: 1)

// variables used for fillers if an object is not found
var fillerTruck = Truck(name: "fillerTruck", id: -1, open: false, img: "null", category_id: -1, menu: "null", description: "null")
var fillerLocation = LandMark(address: "null", latitude: 0, longitude: 0, locationId: -1)
