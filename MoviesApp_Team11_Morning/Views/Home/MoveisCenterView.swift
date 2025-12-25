//
//  MoveisCenter.swift
//  MoviesApp_Team11_Morning
//
//  Updated by Eatzaz Hafiz on 25/12/2025.
//

import SwiftUI
import Combine


struct MoveisCenterView: View {
    @StateObject private var viewModel = MoveisCenterViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack{
                        Text("Movies Center")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Image("ProfileIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    .padding(.horizontal)
                    
                    // Search Bar
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.gray)
                        
                        Text("Search for Movie name, actors ...")
                            .foregroundColor(Color.gray)
                            .font(.subheadline)
                        
                        Spacer()
                    }
                    .padding(12)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // High Rated Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("High Rated")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        FeaturedCarouselView()
                    }
                    
                    // Drama Section
                    CategorySection(
                        title: "Drama",
                        movies: viewModel.dramaMovies
                    )
                    .padding(.top, 8)
                    
                    // Comedy Section
                    CategorySection(
                        title: "Comedy",
                        movies: viewModel.comedyMovies
                    )
                    .padding(.top, 8)
                    
                    // Action Section
                    CategorySection(
                        title: "Action",
                        movies: viewModel.actionMovies
                    )
                    .padding(.top, 8)
                    
                }
                .padding(.vertical)
            }
            .preferredColorScheme(.dark)
            .background(Color.black)
        }
    }
}


struct CategorySection: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Show more")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(movies) { movie in
                        MovieCardView(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


struct MovieCardView: View {
    let movie: Movie
    
    var body: some View {
        Image(movie.poster)
            .resizable()
            .scaledToFill()
            .frame(width: 170, height: 255)
            .clipped()
            .cornerRadius(12)
    }
}


struct FeaturedCarouselView: View {
    let featuredMovies = [
        ("TopGun", "Top Gun", 4.8, "Action • 2 hr 9 min"),
        ("TopGun", "Top Gun: Maverick", 4.9, "Action • 2 hr 11 min"),
        ("TopGun", "Top Gun", 4.8, "Action • 2 hr 9 min")
    ]
    
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(featuredMovies.indices, id: \.self) { index in
                ZStack(alignment: .bottomLeading) {
                    Image(featuredMovies[index].0)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 420)
                        .clipped()
                        .cornerRadius(20)
                    
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.8)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(featuredMovies[index].1)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        HStack(spacing: 4) {
                            ForEach(0..<5) { star in
                                Image(systemName: star < 4 ? "star.fill" : "star.leadinghalf.filled")
                                    .foregroundColor(.yellow)
                                    .font(.caption)
                            }
                            Text(String(format: "%.1f out of 5", featuredMovies[index].2))
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        
                        Text(featuredMovies[index].3)
                            .foregroundColor(.white.opacity(0.8))
                            .font(.subheadline)
                    }
                    .padding(20)
                }
                .padding(.horizontal)
                .tag(index)
            }
        }
        .frame(height: 440)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % featuredMovies.count
            }
        }
    }
}


#Preview {
    MoveisCenterView()
}
