//
//  SignUpController.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//

import SwiftUI

struct SignUpController: View {
    @State var content = SignUpContent(
        grandTitre: "On savait que t'avait de l'inspi !",
        accroche: "Fait nous kiffer !",
        imageName: "SignUpImg",
        emailLabel: "Email",
        pwdLabel: "Password",
        confirmPwdLabel: "Confirmer votre mot de passe",
        signUpButton: "Sign Up",
        titleRedirection: "Déjà inscrit ? T'es un bon !",
        linkRedirection: "Connecte toi !"
    )
    
    @State private var showError = false
    @State private var navigateToLogin = false   // 🔑 contrôle la navigation
    
    var body: some View {
        SignUpView(content: $content,
                  onButtonTap: {
                    if content.email.isEmpty || content.pwd.isEmpty || content.confirmPwd.isEmpty {
                        showError = true
                    } else if content.pwd != content.confirmPwd {
                        showError = true
                    } else {
                        print("Inscription réussie avec \(content.email)")
                        navigateToLogin = true   // redirection après inscription réussie
                    }
                  },
                  onRedirectTap: {
                      navigateToLogin = true   // 🔑 déclenche la navigation vers Login
                  }
        )
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Erreur"),
                message: Text("Tous les champs sont obligatoires et les mots de passe doivent correspondre."),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationDestination(isPresented: $navigateToLogin) {
            LoginController()
        }

    }
}

struct SignUpController_Previews: PreviewProvider {
    static var previews: some View {
        SignUpController()
    }
}





