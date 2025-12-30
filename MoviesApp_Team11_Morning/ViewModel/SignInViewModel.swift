//
//  SignIn.swift
//  MoviesApp_Team11_Morning
//
//  Created by Ruba Arif on 04/07/1447 AH.
//

import Foundation
import SwiftUI
import Combine

final class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPasswordVisible: Bool = false

    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    func signIn() {
        errorMessage = nil

        let e = email.trimmingCharacters(in: .whitespacesAndNewlines)
        if e.isEmpty || password.isEmpty {
            errorMessage = "Please enter email and password."
            return
        }

        // لاحقاً: API
        print("Sign in:", e)
    }
}
