
import Foundation

// MARK: - Review Model
struct Review: Identifiable {
    let id = UUID()
    let movieId: UUID
    var reviewText: String
    var rating: Int
    let date: Date
    let userId: String
    
    init(movieId: UUID, reviewText: String, rating: Int, userId: String) {
        self.movieId = movieId
        self.reviewText = reviewText
        self.rating = rating
        self.date = Date()
        self.userId = userId
    }
}
