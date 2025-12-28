import SwiftUI
import Combine

// MARK: - Add Review ViewModel
class AddReviewViewModel: ObservableObject {
    @Published var reviewText: String = ""
    @Published var rating: Int = 0
    
    var isValidReview: Bool {
        !reviewText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && rating > 0
    }
    
    func submitReview() {
        guard isValidReview else { return }
        
        // Here you would save the review to your data store
        print("Review submitted:")
        print("Text: \(reviewText)")
        print("Rating: \(rating)")
        
        // Reset form
        reviewText = ""
        rating = 0
    }
}
