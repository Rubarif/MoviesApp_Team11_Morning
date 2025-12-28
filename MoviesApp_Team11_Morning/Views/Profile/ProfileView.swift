//
//  ProfileView.swift
//  MoviesApp_Team11_Morning
//
//  Created on 25/12/2025.
//

import SwiftUI

// MARK: - Main Profile View
struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showingEditProfile = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 24) {
                    // Profile Header Card
                    Button(action: {
                        showingEditProfile = true
                    }) {
                        HStack(spacing: 16) {
                            Image("ProfileIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(viewModel.fullName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(viewModel.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    // Saved Movies Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Saved movies")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        if viewModel.savedMovies.isEmpty {
                            EmptySavedMoviesView()
                        } else {
                            SavedMoviesGridView(movies: viewModel.savedMovies)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Back action
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.yellow)
                    }
                }
            }
            .sheet(isPresented: $showingEditProfile) {
                ProfileInfoView(viewModel: viewModel)
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Empty Saved Movies View
struct EmptySavedMoviesView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "film.stack")
                .font(.system(size: 80))
                .foregroundColor(.gray.opacity(0.5))
            
            Text("No saved movies yet, start save\nyour favourites")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 60)
    }
}

// MARK: - Saved Movies Grid View
struct SavedMoviesGridView: View {
    let movies: [Movie]
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(movies) { movie in
                    Image(movie.poster)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 220)
                        .clipped()
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Profile Info View (Middle Screen)
struct ProfileInfoView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showingEditProfile = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 32) {
                    // Profile Image
                    Image("ProfileIcon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.top, 32)
                    
                    // Profile Info Fields
                    VStack(spacing: 0) {
                        ProfileInfoRow(label: "First name", value: viewModel.firstName)
                        
                        Divider()
                            .background(Color.gray.opacity(0.3))
                            .padding(.horizontal)
                        
                        ProfileInfoRow(label: "Last name", value: viewModel.lastName)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Sign Out Button
                    Button(action: {
                        // Sign out action
                    }) {
                        Text("Sign Out")
                            .font(.headline)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("Profile info")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.yellow)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingEditProfile = true
                    }) {
                        Text("Edit")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .sheet(isPresented: $showingEditProfile) {
                EditProfileView(viewModel: viewModel)
            }
        }
    }
}

// MARK: - Profile Info Row
struct ProfileInfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
                .frame(width: 100, alignment: .leading)
            
            Text(value)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - Edit Profile View (Right Screen)
struct EditProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 32) {
                    // Profile Image with Edit Button
                    ZStack(alignment: .bottomTrailing) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 120, height: 120)
                        
                        Image(systemName: "camera.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            showingImagePicker = true
                        }) {
                            Image(systemName: "camera.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .frame(width: 36, height: 36)
                                .background(Color.yellow)
                                .clipShape(Circle())
                        }
                        .offset(x: 5, y: 5)
                    }
                    .padding(.top, 32)
                    
                    // Edit Fields
                    VStack(spacing: 0) {
                        EditProfileRow(label: "First name", text: $firstName)
                        
                        Divider()
                            .background(Color.gray.opacity(0.3))
                            .padding(.horizontal)
                        
                        EditProfileRow(label: "Last name", text: $lastName)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.yellow)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.updateProfile(firstName: firstName, lastName: lastName)
                        dismiss()
                    }) {
                        Text("Save")
                            .foregroundColor(.yellow)
                            .bold()
                    }
                }
            }
            .onAppear {
                firstName = viewModel.firstName
                lastName = viewModel.lastName
            }
        }
    }
}

// MARK: - Edit Profile Row
struct EditProfileRow: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
                .frame(width: 100, alignment: .leading)
            
            TextField("", text: $text)
                .foregroundColor(.white)
                .textFieldStyle(PlainTextFieldStyle())
            
            Spacer()
        }
        .padding()
    }
}


#Preview {
    ProfileView()
}
