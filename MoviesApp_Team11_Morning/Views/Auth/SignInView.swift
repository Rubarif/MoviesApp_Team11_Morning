//
//  SignInView.swift
//  MoviesApp_Team11_Morning
//
//  Created by Ruba Arif on 04/07/1447 AH.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var vm = SignInViewModel()

    var body: some View {
        ZStack {
            // Background img
            GeometryReader { geo in
                ZStack(alignment: .top) {
                    //  BGlayer
                    Color("BGlayer")
                        .ignoresSafeArea()

                    Image("SignInBg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .offset(y: UI.bgTopOffset)   // -150
                        .clipped()
                        .ignoresSafeArea()
                }
            }
            .ignoresSafeArea()

            // BG layer
            GeometryReader { geo in
                LinearGradient(
                    stops: [
                        .init(color: Color("BGlayer").opacity(0.10), location: 0.00),
                        .init(color: Color("BGlayer").opacity(0.35), location: 0.35),
                        .init(color: Color("BGlayer").opacity(0.90), location: 0.70),
                        // تحت مرة غامق
                        .init(color: Color("BGlayer").opacity(1.50), location: 0.80),
                        .init(color: Color("BGlayer").opacity(2.00), location: 1.00)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(width: geo.size.width, height: UI.bgLayerHeight)
                .offset(y: UI.bgLayerTopOffset)
                .clipped()
                .ignoresSafeArea()
            }
            .ignoresSafeArea()

            content
        }
    }

    private var content: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()

            Text("Sign in")
                .font(.system(size: UI.titleSize, weight: .bold))
                .foregroundStyle(.white)

            Text("You'll find what you're looking for in the\nocean of movies")
                .font(.system(size: UI.subtitleSize))
                .foregroundStyle(.white.opacity(0.9))
                .fixedSize(horizontal: false, vertical: true)

            VStack(alignment: .leading, spacing: 12) {
                Text("Email")
                    .font(.system(size: UI.labelSize, weight: .medium))
                    .foregroundStyle(.white.opacity(0.7))

                AppTextField(
                    text: $vm.email,
                    placeholder: "Academy23@gmail.com",
                    keyboard: .emailAddress
                )

                Text("Password")
                    .font(.system(size: UI.labelSize, weight: .medium))
                    .foregroundStyle(.white.opacity(0.7))

                AppPasswordField(
                    text: $vm.password,
                    placeholder: "N346455_4",
                    isVisible: $vm.isPasswordVisible
                )
            }
            .padding(.top, 10)

            Button {
                vm.signIn()
            } label: {
                Text("Sign in")
                    .font(.system(size: UI.buttonTextSize, weight: .semibold))
                    .foregroundStyle(.black)
                    
                    .frame(width: UI.buttonWidth, height: UI.buttonHeightFigma)
                    .background(Color("PrimaryColor"))
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: UI.buttonCornerRadius,
                            style: .continuous
                        )
                    )
            }
            .padding(.top, 18)

            if let err = vm.errorMessage {
                Text(err)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.red.opacity(0.9))
                    .padding(.top, 6)
            }

            Spacer().frame(height: 26)
        }
        .padding(.horizontal, UI.sidePadding)
    }
}

//  UI Constants
private enum UI {
    static let sidePadding: CGFloat = 20

    static let titleSize: CGFloat = 44
    static let subtitleSize: CGFloat = 18
    static let labelSize: CGFloat = 16

    static let fieldHeight: CGFloat = 54
    static let buttonHeight: CGFloat = 56

    static let cornerRadius: CGFloat = 14
    static let buttonTextSize: CGFloat = 20

    static let buttonColor: Color = Color(red: 0.96, green: 0.80, blue: 0.30)

    
    static let fieldBg: Color = Color("FieldsColor")
    static let placeholderOpacity: Double = 0.35

    static let bgTopOffset: CGFloat = -150

    // BGlayer
    static let bgLayerHeight: CGFloat = 998
    static let bgLayerTopOffset: CGFloat = -154

    
    static let fieldWidth: CGFloat = 358
    static let fieldHeightFigma: CGFloat = 44


    static let fieldCornerRadius: CGFloat = 8

    
    static let buttonWidth: CGFloat = 358
    static let buttonHeightFigma: CGFloat = 44
    static let buttonCornerRadius: CGFloat = 8
}

// - Components
private struct AppTextField: View {
    @Binding var text: String
    let placeholder: String
    var keyboard: UIKeyboardType = .default

    var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(placeholder)
                .foregroundStyle(.white.opacity(UI.placeholderOpacity))
        )
        .keyboardType(keyboard)
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled(true)
        .foregroundStyle(.white)
        .padding(.horizontal, 16)
        
        .frame(width: UI.fieldWidth, height: UI.fieldHeightFigma)
        .background(UI.fieldBg)
        .clipShape(
            RoundedRectangle(
                cornerRadius: UI.fieldCornerRadius,
                style: .continuous
            )
        )
    }
}

private struct AppPasswordField: View {
    @Binding var text: String
    let placeholder: String
    @Binding var isVisible: Bool

    var body: some View {
        HStack(spacing: 10) {
            Group {
                if isVisible {
                    TextField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .foregroundStyle(.white.opacity(UI.placeholderOpacity))
                    )
                } else {
                    SecureField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .foregroundStyle(.white.opacity(UI.placeholderOpacity))
                    )
                }
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .foregroundStyle(.white)

            Spacer(minLength: 0)

            Button {
                isVisible.toggle()
            } label: {
                Image(systemName: isVisible ? "eye.slash" : "eye")
                    .foregroundStyle(.white.opacity(0.75))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16)
        
        .frame(width: UI.fieldWidth, height: UI.fieldHeightFigma)
        .background(UI.fieldBg)
        .clipShape(
            RoundedRectangle(
                cornerRadius: UI.fieldCornerRadius,
                style: .continuous
            )
        )
    }
}

#Preview {
    SignInView()
}
