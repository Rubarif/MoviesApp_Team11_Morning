//
//  MoviesCenterModel.swift
//  MoviesApp_Team11_Morning
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let poster: String
    let rating: Double
    let category: String
}
//
