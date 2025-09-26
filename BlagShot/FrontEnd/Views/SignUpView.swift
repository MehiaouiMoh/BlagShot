//
//  SignUpView.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//

import SwiftUI

struct SignUpView: View {
    @Binding var content: SignUpContent
    var onButtonTap: () -> Void
    var onRedirectTap: () -> Void
    
    var body: some View {
        ZStack {
            
            
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
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1) // couleur et épaisseur de la bordure
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text(content.pwdLabel)
                            .font(.headline)
                        SecureField("Enter your password...", text: $content.pwd)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1) // couleur et épaisseur de la bordure
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text(content.confirmPwdLabel)
                            .font(.headline)
                        SecureField("Confirm your password", text: $content.confirmPwd)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1) // couleur et épaisseur de la bordure
                            )
                    }
                }
                .padding(.horizontal)
                
                // Bouton Sign In
                Button(action: onButtonTap) {
                    Text(content.signUpButton)
                        .frame(maxWidth: 150)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .padding(.horizontal, 20)
                }
                
                // Redirection Sign Up
                HStack {
                    Text(content.titleRedirection)
                        .font(.system(size:17, weight: .bold))
                    Button(action: onRedirectTap) {
                        Text(content.linkRedirection)
                            .underline()
                            .foregroundColor(.blue)
                            .font(.system(size:17, weight: .bold))
                    }
                }
                .padding(.top, 10)
            }
            .padding(.top, 50)
        }
    }
}



