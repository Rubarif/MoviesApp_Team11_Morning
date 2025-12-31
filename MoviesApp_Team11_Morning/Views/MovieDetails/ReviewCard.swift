//
//  ReviewCard.swift
//  MoviesApp_Team11_Morning
//
//  Created by Ruba Arif on 07/07/1447 AH.
//

/*
import SwiftUI

struct ReviewCard: View {

    let imageName: String
    let name: String
    let stars: Int
    let text: String
    let date: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            HStack(spacing: 14) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .foregroundColor(.white)
                        .font(.headline)

                    HStack(spacing: 3) {
                        ForEach(0..<stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                    }
                }
            }

            Text(text)
                .foregroundColor(.white.opacity(0.95))
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            HStack {
                Spacer()
                Text(date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(26)
        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white.opacity(0.08))
        )
    }
}


#Preview {
    ReviewCard(
        imageName: "user_review",
        name: "Afnan Abdullah",
        stars: 5,
        text: "This is an engaging simple, good-hearted film with just enough darkness around the edges to give contrast and relief to its glowingly benign view of human nature.",
        date: "Tuesday"
    )
    .background(Color.black)
}

*/

import SwiftUI

// MARK: - Single Review Card
struct ReviewCard: View {

    let imageName: String
    let name: String
    let stars: Int
    let text: String
    let date: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            HStack(spacing: 14) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .foregroundColor(.white)
                        .font(.headline)

                    HStack(spacing: 3) {
                        ForEach(0..<stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                    }
                }
            }

            Text(text)
                .foregroundColor(.white.opacity(0.95))
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            HStack {
                Spacer()
                Text(date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(26)
        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white.opacity(0.08))
        )
    }
}
// MARK: - Reviews Horizontal List (Used in Movie Details)
struct ReviewsHorizontalList: View {

    var body: some View {
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

#Preview("Single Review Card") {
    ZStack {
        Color.black.ignoresSafeArea()

        ReviewCard(
            imageName: "user_review",
            name: "Afnan Abdullah",
            stars: 5,
            text: "This is an engaging simple, good-hearted film with just enough darkness around the edges to give contrast and relief to its glowingly benign view of human nature.",
            date: "Tuesday"
        )
    }
}
