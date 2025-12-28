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

                // MARK: - Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {

                        infoRow(left: ("Duration","2 hours 22 mins"),
                                right: ("Language","English"))

                        infoRow(left: ("Genre","Drama"),
                                right: ("Age","+15"))

                        storySection
                        imdbSection
                        directorSection
                        starsSection

                        // MARK: - Rating & Reviews (⭐️ المطلوب)
                        ratingAndReviews
                    }
                    .padding()
                }
            }
        }
    }

    // MARK: - Sections

    private var storySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Story")
                .foregroundColor(.white)
                .font(.headline)

            Text("""
            In 1947, Andy Dufresne, a banker in Maine, is convicted of the murders of his wife and her lover.
            He is sentenced to life imprisonment at Shawshank State Penitentiary, where he befriends Ellis Boyd
            “Red” Redding and finds ways to live with hope inside prison walls.
            """)
            .foregroundColor(.gray)
            .lineSpacing(4)
        }
    }

    private var imdbSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("IMDb Rating")
                .font(.headline)
                .foregroundColor(.white)
            Text("9.3 / 10")
                .foregroundColor(.gray)
        }
    }

    private var directorSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Director")
                .foregroundColor(.white)
                .font(.headline)

            VStack(alignment: .leading, spacing: 6) {
                Image("frank")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())

                Text("Frank Darabont")
                    .foregroundColor(.white)
            }
        }
    }

    private var starsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Stars")
                .foregroundColor(.white)
                .font(.headline)

            HStack(spacing: 20) {
                starItem(image: "tim", name: "Tim Robbins")
                starItem(image: "morgan", name: "Morgan Freeman")
                starItem(image: "bob", name: "Bob Gunton")
            }
        }
    }

    private var ratingAndReviews: some View {
        VStack(alignment: .leading, spacing: 24) {

            Text("Rating & Reviews")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 4) {
                Text("4.8")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)

                Text("out of 5")
                    .foregroundColor(.gray)
            }

            // ⭐️ Scroll أفقي + كرت كبير
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {

                    ReviewCard(
                        imageName: "user_review",
                        name: "Afnan Abdullah",
                        stars: 5,
                        text: "This is an engagingly simple, good-hearted film, with just enough darkness around the edges to give contrast and relief to its glowingly benign view of human nature.",
                        date: "Tuesday"
                    )

                    ReviewCard(
                        imageName: "user_review2",
                        name: "Sarah Ahmed",
                        stars: 4,
                        text: "A tough, compassionate story about hope and friendship.",
                        date: "Today"
                    )
                }
                .padding(.horizontal)
            }
        }
    }

    // MARK: - Helpers

    private func infoRow(left: (String,String), right: (String,String)) -> some View {
        HStack {
            infoItem(title: left.0, value: left.1)
            Spacer()
            infoItem(title: right.0, value: right.1)
        }
    }

    private func infoItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).foregroundColor(.gray).font(.caption)
            Text(value).foregroundColor(.white).font(.headline)
        }
    }

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
