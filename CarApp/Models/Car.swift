//
//  Car.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 26/08/2024.
//

import Foundation

struct Car: Identifiable, Hashable, Codable {
    let id: String
    let carName: String
    var rating: Double
    let brand: String
    var pricePerDay: Int
    var description: String
    var mainImageName: String
    var imageNames: [String]
    var insurance: String
    var maxDistance: Float?
    var numberOfSeats: Int
    var numberOfDoors: Int
    var gasType: String
    var hostName: String
    var hostImageName: String
    var hostJoinDate: String
    var isFavorite: Bool
}
