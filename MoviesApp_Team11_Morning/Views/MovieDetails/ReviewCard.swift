//
//  ReviewCard.swift
//  MoviesApp_Team11_Morning
//
//  Created by Ruba Arif on 07/07/1447 AH.
//
import SwiftUI

struct ReviewCard: View {

    let imageName: String
    let name: String
    let stars: Int
    let text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {

            // User + stars
            HStack(spacing: 12) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)

                    HStack(spacing: 2) {
                        ForEach(0..<stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 12))
                        }
                    }
                }
            }

            // Review text
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.gray.opacity(0.9))
                .lineSpacing(4)
                .lineLimit(nil)   // مهم
        }
        .padding(18)
        .frame(width: 300)      // أعرض
        .background(Color.white.opacity(0.06))
        .cornerRadius(18)
    }
}

#Preview {
    ReviewCard(
        imageName: "user_review",
        name: "Afnan Abdullah",
        stars: 5,
        text: "This is an engaging simple, good-hearted film with just enough darkness around the edges to give contrast and relief to its glowingly benign view of human nature."
    )
    .background(Color.black)
}
