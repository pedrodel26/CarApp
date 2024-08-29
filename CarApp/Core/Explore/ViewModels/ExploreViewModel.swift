//
//  ExploreViewModel.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 26/08/2024.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
    
    @Published var brands: [Brand] = [
        .init(id: UUID().uuidString, brandName: "Porsche", imageName: "porsche", cardsIds: []),
        .init(id: UUID().uuidString, brandName: "BMW", imageName: "bmw", cardsIds: []),
        .init(id: UUID().uuidString, brandName: "Ferrari", imageName: "ferrari", cardsIds: []),
        .init(id: UUID().uuidString, brandName: "Land Rover", imageName: "landrover", cardsIds: [])
    ]
    
    @Published var cars: [Car] = [
        .init(id: UUID().uuidString, carName: "Porsche 911 GTS Turbo", rating: 8.3, brand: "Porsche", pricePerDay: 49, description: "Nice car to drive in a big road", mainImageName: "porsche1", imageNames: ["porsche4","porsche2", "porsche1"], insurance: "Travelers insurance", numberOfSeats: 5, numberOfDoors: 4, gasType: "Premium", hostName: "LM Car Automotive", hostImageName: "porsche_profile", hostJoinDate: "27 Agosto 2024", isFavorite: false),
        
            .init(id: UUID().uuidString, carName: "BMW X7 V6", rating: 8.6, brand: "BMW", pricePerDay: 44, description: "Car enjoy during the day", mainImageName: "bmw1", imageNames: ["bmw1","mercedes1","bmw3"], insurance: "Travelers insurance", numberOfSeats: 4, numberOfDoors: 5, gasType: "Podium", hostName: "Delmondes Automotive", hostImageName: "porsche_profile", hostJoinDate: "12 March 2023", isFavorite: true)
    ]
}
