
import SwiftUI
import Combine


class ProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile
    @Published var savedMovies: [Movie] = []
    
    init() {
        // Initialize with default user data
        self.userProfile = UserProfile(
            firstName: "Sarah",
            lastName: "Abdullah",
            email: "Xxxx234@gmail.com",
            profileImage: "ProfileIcon"
        )
        loadSavedMovies()
    }
    
    var firstName: String {
        userProfile.firstName
    }
    
    var lastName: String {
        userProfile.lastName
    }
    
    var email: String {
        userProfile.email
    }
    
    var fullName: String {
        userProfile.fullName
    }
    
    var profileImage: String {
        userProfile.profileImage
    }
    
    func updateProfile(firstName: String, lastName: String) {
        userProfile.firstName = firstName
        userProfile.lastName = lastName
    }
    
    func loadSavedMovies() {
        // Load saved movies from storage
        // For now, empty array will show the empty state
        // Later you can add movies here:
        // savedMovies = [
        //     Movie(title: "Top Gun", poster: "TopGun", rating: 4.8, category: "Action")
        // ]
    }
    
    func toggleMovieSaved(_ movie: Movie) {
        if let index = savedMovies.firstIndex(where: { $0.id == movie.id }) {
            savedMovies.remove(at: index)
        } else {
            savedMovies.append(movie)
        }
    }
    
    func isMovieSaved(_ movie: Movie) -> Bool {
        savedMovies.contains(where: { $0.id == movie.id })
    }
}
