//
//  LoginView.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//
import SwiftUI

struct LoginView: View {
    @Binding var content: LoginContent
    var onButtonTap: () -> Void
    
    var body: some View {
        ZStack {
            Color(hex: "FFE01A").ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Titre
                Text(content.grandTitre)
                    .font(.system(size: 40, weight: .bold))
                    .multilineTextAlignment(.center)
                
                // Accroche
                Text(content.accroche)
                    .font(.system(size: 25, weight: .medium))
                    .multilineTextAlignment(.center)
                
                // Image
                if let uiImage = UIImage(named: content.imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                } else {
                    Text("Image introuvable")
                        .foregroundColor(.red)
                }
                
                // Champs email + mot de passe
                VStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        Text(content.emailLabel)
                            .font(.headline)
                        TextField("Enter your email...", text: $content.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(content.pwdLabel)
                            .font(.headline)
                        SecureField("Enter your password...", text: $content.pwd)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                .padding(.horizontal)
                
                // Bouton Sign In
                Button(action: onButtonTap) {
                    Text(content.signInButton)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                
                // Redirection Sign Up
                HStack {
                    Text(content.titleRedirection)
                    Button(action: {
                        // Navigation vers SignUp
                    }) {
                        Text(content.linkRedirection)
                            .underline()
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 10)
            }
            .padding(.top, 50)
        }
    }
}

