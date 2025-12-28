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
    let date: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            HStack(spacing: 14) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)

                    HStack(spacing: 3) {
                        ForEach(0..<stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 13))
                        }
                    }
                }
            }

            Text(text)
                .font(.system(size: 18))
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
        .frame(
            width: UIScreen.main.bounds.width - 40,
            alignment: .leading
        )
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
