//
//  MoveisCenterViewModel.swift
//  MoviesApp_Team11_Morning
//

import SwiftUI
import Combine

class MoveisCenterViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchText: String = ""
    
    init() {
        loadMovies()
    }
    
    var highRatedMovies: [Movie] {
        movies.filter { $0.rating >= 4.5 }
    }
    
    var dramaMovies: [Movie] {
        movies.filter { $0.category == "Drama" }
    }
    
    var comedyMovies: [Movie] {
        movies.filter { $0.category == "Comedy" }
    }
    
    var actionMovies: [Movie] {
        movies.filter { $0.category == "Action" }
    }
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func loadMovies() {
        // Drama Movies
        movies.append(contentsOf: [
            Movie(title: "The Shawshank Redemption", poster: "TheShawshankRedemption", rating: 4.9, category: "Drama"),
            Movie(title: "A Star Is Born", poster: "AStarIsBorn", rating: 4.7, category: "Drama")
        ])
        
        // Comedy Movies
        movies.append(contentsOf: [
            Movie(title: "World's Greatest Dad", poster: "World'sGreatDad", rating: 4.3, category: "Comedy"),
            Movie(title: "House Party", poster: "HouseParty", rating: 4.1, category: "Comedy")
        ])
        
        // Action Movies
        movies.append(contentsOf: [
            Movie(title: "Top Gun", poster: "TopGun", rating: 4.8, category: "Action"),
            Movie(title: "Mission Impossible", poster: "TopGun", rating: 4.7, category: "Action")
        ])
    }
}
