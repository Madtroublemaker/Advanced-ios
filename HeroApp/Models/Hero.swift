//
//  Hero.swift
//  HeroApp
//
//  Created by Madina Abdulgafar on 20.03.2025.
//

import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let powerStats: PowerStats
    let biography: Biography
}

struct PowerStats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Biography: Codable {
    let fullName: String
    let placeOfBirth: String
    let alignment: String
}
