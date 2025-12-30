//
//  AddReviewView.swift
//  MoviesApp_Team11_Morning
//
//  Created on 25/12/2025.
//

import SwiftUI

struct AddReviewView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = AddReviewViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 0) {
                    // Divider under navigation
                    
                    VStack(alignment: .leading, spacing: 24) {
                        // Review Text Field
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Review")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 24)
                        
                        TextEditor(text: $viewModel.reviewText)
                            .frame(width:358, height: 146)
                            .padding(12)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .scrollContentBackground(.hidden)
                            .overlay(
                                Group {
                                    if viewModel.reviewText.isEmpty {
                                        Text("Enter your review")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 16)
                                            .padding(.top, 20)
                                    }
                                },
                                alignment: .topLeading
                            )
                    }
                    
                    // Rating Section
                    HStack {
                        Text("Rating")
                            .font(.title2)
//                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            ForEach(1...5, id: \.self) { index in
                                Button(action: {
                                    viewModel.rating = index
                                }) {
                                    Image(systemName: index <= viewModel.rating ? "star.fill" : "star")
                                        .font(.title2)
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                }
            }
            .navigationTitle("Write a review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
      /*          ToolbarItem(placement: .navigationBarLeading) {
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
       */
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.submitReview()
                        dismiss()
                    }) {
                        Text("Add")
                            .foregroundColor(.yellow)
                            .bold()
                    }
                    .disabled(!viewModel.isValidReview)
                    .opacity(viewModel.isValidReview ? 1.0 : 0.5)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    AddReviewView()
}
