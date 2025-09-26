//
//  LoginController.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//
import SwiftUI

struct LoginController: View {
    @State private var navigateToSignUp = false
    @State var content = LoginContent(
        grandTitre: "Un humoriste dans l'âme ?",
        accroche: "Prouve nous ça !",
        imageName: "LoginImg",
        emailLabel: "Email",
        pwdLabel: "Password",
        signInButton: "Sign In",
        titleRedirection: "Wesh pas de compte ?",
        linkRedirection: "Créer en un !"
    )
    
    @State private var showError = false
    
    var body: some View {
        LoginView(content: $content,
                  onButtonTap: {
                      if content.email.isEmpty || content.pwd.isEmpty {
                          showError = true
                      } else {
                          print("Connexion réussie avec \(content.email)")
                      }
                  },
                  onRedirectTap: {
                      navigateToSignUp = true   // 🔑 déclenche la navigation vers SignUp
                  }
        )
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Erreur"),
                message: Text("Email et mot de passe sont obligatoires"),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationDestination(isPresented: $navigateToSignUp) {
            SignUpController()
        }

    }
}

struct LoginController_Previews: PreviewProvider {
    static var previews: some View {
        LoginController()
    }
}

