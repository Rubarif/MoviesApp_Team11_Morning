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

            // Background (dark)
            Color.black
                .ignoresSafeArea()


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
                    Spacer()   // يدفع العنوان لأسفل الصورة

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
        }
    }
}

#Preview {
    MovieDetailsView()
}
