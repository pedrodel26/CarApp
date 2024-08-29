//
//  Brand.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 26/08/2024.
//

import Foundation

struct Brand: Identifiable, Hashable, Codable {
    let id: String
    let brandName: String
    let imageName: String
    var cardsIds: [String]
}
