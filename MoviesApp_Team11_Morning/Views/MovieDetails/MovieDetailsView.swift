//
//  MovieDetails.swift
//  MoviesApp_Team11_Morning
//
//  Created by Ruba Arif on 03/07/1447 AH.
//


import SwiftUI

struct MovieDetailsView: View {

    private let heroHeight: CGFloat = 420

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {

                Color.black
                    .ignoresSafeArea()

                //  Hero Image (خلف النوتش)
                ZStack(alignment: .top) {

                    Image("Shawshanks")
                        .resizable()
                        .scaledToFill()
                        .frame(height: heroHeight)
                        .clipped()
                        .ignoresSafeArea(.container, edges: .top)

                    LinearGradient(
                        colors: [
                            Color.black.opacity(0.0),
                            Color.black.opacity(0.75)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: heroHeight)

                    // Top Buttons
                    HStack {
                        Button {} label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.yellow)
                                .padding()
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }

                        Spacer()

                        HStack(spacing: 12) {
                            Button {} label: {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.yellow)
                                    .padding()
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Circle())
                            }

                            Button {} label: {
                                Image(systemName: "bookmark")
                                    .foregroundColor(.yellow)
                                    .padding()
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }

                // MARK: - Scroll Content
                ScrollView {
                    VStack(spacing: 0) {

                        // مساحة الصورة
                        Color.clear
                            .frame(height: heroHeight)

                        // كل المحتوى بخلفية سوداء
                        VStack(alignment: .leading, spacing: 24) {
                            Text("Shawshank")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            // Duration / Language
                            HStack {
                                infoItem(title: "Duration", value: "2 hours 22 mins")
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                infoItem(title: "Language", value: "English")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            // Genre / Age
                            HStack {
                                infoItem(title: "Genre", value: "Drama")
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                infoItem(title: "Age", value: "+15")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            // Story
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Story")
                                    .font(.headline)
                                    .foregroundColor(.white)

                                Text("""
                                Synopsis. In 1947, Andy Dufresne (Tim Robbins), a banker in Maine, is convicted of murdering his wife and her lover. Since the state of Maine has no death penalty, he is given two consecutive life sentences and sent to the notoriously harsh Shawshank Prison.
                                """)
                                .foregroundColor(.gray)
                            }

                            Divider().background(Color.gray.opacity(0.3))

                            // IMDb Rating
                            VStack(alignment: .leading, spacing: 6) {
                                Text("IMDb Rating")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text("9.3 / 10")
                                    .foregroundColor(.gray)
                            }

                            Divider().background(Color.gray.opacity(0.3))

                            // Director
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Director")
                                    .font(.headline)
                                    .foregroundColor(.white)

                                VStack(spacing: 6) {
                                    Image("frank")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())

                                    Text("Frank Darabont")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                            }

                            Divider().background(Color.gray.opacity(0.3))

                            // Stars
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Stars")
                                    .font(.headline)
                                    .foregroundColor(.white)

                                HStack(spacing: 20) {
                                    starItem(image: "tim", name: "Tim Robbins")
                                    starItem(image: "morgan", name: "Morgan Freeman")
                                    starItem(image: "bob", name: "Bob Gunton")
                                }
                            }

                            Divider().background(Color.gray.opacity(0.3))

                            // Rating & Reviews
                            VStack(alignment: .leading, spacing: 24) {
                                Text("Rating & Reviews")
                                    .font(.headline)
                                    .foregroundColor(.white)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("4.8")
                                        .font(.system(size: 42, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("out of 5")
                                        .foregroundColor(.gray)
                                }

                                ReviewsHorizontalList()
                            }

                            // Write Review Button
                            NavigationLink(destination: AddReviewView()) {
                                HStack {
                                    Image(systemName: "square.and.pencil")
                                    Text("Write a review")
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.yellow)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.yellow, lineWidth: 1.5)
                                )
                            }
                            .padding(.bottom, 40)
                        }
                        .padding()
                        .background(Color.black)
                    }
                }
            }
        }
    }

    // MARK: - Helpers
    private func infoItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .foregroundColor(.white)
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
