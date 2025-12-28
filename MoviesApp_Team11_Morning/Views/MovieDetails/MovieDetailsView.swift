//
//  MovieDetails.swift
//  MoviesApp_Team11_Morning
//
//  Created by Ruba Arif on 03/07/1447 AH.
//

import SwiftUI

struct MovieDetailsView: View {

    @State private var showAddReview = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {

                      
                        ZStack(alignment: .top) {

                            Image("Shawshanks")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 420)
                                .clipped()
                                .ignoresSafeArea(edges: .top)

                            LinearGradient(
                                colors: [
                                    Color.black.opacity(0.0),
                                    Color.black.opacity(0.7)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(height: 420)

                
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
                        }

                  
                        VStack(alignment: .leading, spacing: 24) {

                            HStack {
                                Text("Drama")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("+15")
                                    .foregroundColor(.gray)
                            }

                        
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

                            // MARK: - Rating & Reviews
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

                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {

                                        ReviewCard(
                                            imageName: "user_review",
                                            name: "Afnan Abdullah",
                                            stars: 5,
                                            text: "This is an engagingly simple, good-hearted film, with just enough darkness around the edges to give contrast and relief to its glowingly benign view of human nature.",
                                            date: "Tuesday"
                                        )
                                        .id("review-1")

                                        ReviewCard(
                                            imageName: "user_review2",
                                            name: "Sarah Ahmed",
                                            stars: 4,
                                            text: "A tough, compassionate story about hope and friendship.",
                                            date: "Today"
                                        )
                                        .id("review-2")
                                    }
                                }
                            }

                           
                            Button {
                                showAddReview = true
                            } label: {
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
                            .padding(.top, 16)
                            .padding(.bottom, 40)
                        }
                        .padding()
                    }
                }
            }
            .navigationDestination(isPresented: $showAddReview) {
                AddReviewView()
            }
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
