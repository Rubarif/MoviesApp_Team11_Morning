//
//  MovieDetails.swift
//  MoviesApp_Team11_Morning
//
//  Created by Ruba Arif on 03/07/1447 AH.
//

import SwiftUI

struct MovieDetailsView: View {
    var body: some View {

        ZStack(alignment: .top) {

            // Background
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // MARK: - Hero Section
                ZStack(alignment: .top) {

                    Image("Shawshanks")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 500)
                        .clipped()
                        .ignoresSafeArea(edges: .top)

                    LinearGradient(
                        colors: [
                            Color.black.opacity(0.0),
                            Color.black.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 500)
                    .ignoresSafeArea(edges: .top)

                    // Movie Title
                    VStack {
                        Spacer()

                        Text("Shawshank")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                    }
                    .frame(height: 500)

                    // Top Buttons
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.yellow)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())

                        Spacer()

                        HStack(spacing: 12) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.yellow)
                                .padding()
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())

                            Image(systemName: "bookmark")
                                .foregroundColor(.yellow)
                                .padding()
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }

                // MARK: - Content Section
                ScrollView {

                    VStack(alignment: .leading, spacing: 24) {

                        // Duration / Language
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Duration")
                                    .foregroundColor(.gray)
                                    .font(.caption)

                                Text("2 hours 22 mins")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }

                            Spacer()

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Language")
                                    .foregroundColor(.gray)
                                    .font(.caption)

                                Text("English")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        }

                        // Genre / Age
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Genre")
                                    .foregroundColor(.gray)
                                    .font(.caption)

                                Text("Drama")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }

                            Spacer()

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Age")
                                    .foregroundColor(.gray)
                                    .font(.caption)

                                Text("+15")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        }

                        // Story
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Story")
                                .font(.headline)
                                .foregroundColor(.white)

                            Text("""
                            In 1947, Andy Dufresne, a banker in Maine, is convicted of the murders of his wife and her lover.
                            He is sentenced to life imprisonment at Shawshank State Penitentiary, where he befriends Ellis Boyd
                            “Red” Redding and finds ways to live with hope inside prison walls.
                            """)
                            .foregroundColor(.gray)
                            .font(.body)
                            .lineSpacing(4)
                        }

                        // IMDb Rating
                        VStack(alignment: .leading, spacing: 8) {
                            Text("IMDb Rating")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Text("9.3 / 10")
                                .font(.body)
                                .foregroundColor(.gray)
                        }

                        // Director
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Director")
                                .font(.headline)
                                .foregroundColor(.white)

                            VStack(alignment: .leading, spacing: 8) {
                                Image("frank")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())

                                Text("Frank Darabont")
                                    .foregroundColor(.white)
                                    .font(.body)
                            }
                        }

                        // Stars
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Stars")
                                .font(.headline)
                                .foregroundColor(.white)

                            HStack(spacing: 20) {
                                starItem(image: "tim", name: "Tim Robbins")
                                starItem(image: "morgan", name: "Morgan Freeman")
                                starItem(image: "bob", name: "Bob Gunton")
                            }
                        }

                        // Rating & Reviews
                        VStack(alignment: .leading, spacing: 19) {

                            Text("Rating & Reviews")
                                .font(.headline)
                                .foregroundColor(.white)

                            Text("4.8")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Text("out of 5")
                                .font(.caption)
                                .foregroundColor(.gray)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {

                                    ReviewCard(
                                        imageName: "user_review",
                                        name: "Afnan Abdullah",
                                        stars: 5,
                                        text: "This is an engaging simple, good-hearted film..."
                                    )

                                    ReviewCard(
                                        imageName: "user_review2",
                                        name: "Sarah Ahmed",
                                        stars: 4,
                                        text: "A tough, compassionate story about hope and friendship."
                                    )
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                    .padding()
                }
                
            }
        }
    }

    // MARK: - Helper
    private func starItem(image: String, name: String) -> some View {
        VStack(spacing: 6) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())

            Text(name)
                .foregroundColor(.white)
                .font(.caption)
        }
    }
}

// Preview
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}
