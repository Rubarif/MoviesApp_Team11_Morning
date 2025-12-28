
import Foundation


struct UserProfile: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var email: String
    var profileImage: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
