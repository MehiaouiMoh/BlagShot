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
        nameLabel: "Name",
        emailLabel: "Email",
        pwdLabel: "Password",
        confirmPwdLabel: "Confirm Password",
        signUpButton: "Sign Up",
        titleRedirection: "Déjà inscrit ? T'es un bon !",
        linkRedirection: "Connecte toi !"
    )
    
    @State private var showError = false
    @State private var navigateToLogin = false   // 🔑 contrôle la navigation
    @State private var errorMessage = ""
    
    var body: some View {
        SignUpView(content: $content,
                  onButtonTap: {
                    if content.email.isEmpty || content.pwd.isEmpty || content.confirmPwd.isEmpty {
                        showError = true
                    } else if content.pwd != content.confirmPwd {
                        showError = true
                    } else {
                        Task{
                            await handleRegister()
                        }
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
    // MARK: - Requête d'inscription
        func handleRegister() async {
            guard let url = URL(string: "http://localhost:8080/api/users") else {
                errorMessage = "URL invalide"
                showError = true
                return
            }
            
            let body: [String: Any] = [
                "name": content.name,
                "email": content.email,
                "password": content.pwd,
                "rol": "user"
            ]
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
                errorMessage = "Erreur de sérialisation JSON"
                showError = true
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    errorMessage = "Réponse invalide du serveur."
                    showError = true
                    return
                }
                
                if httpResponse.statusCode == 201 {
                    print("✅ Inscription réussie avec \(content.email)")
                    navigateToLogin = true
                } else {
                    let serverMessage = String(data: data, encoding: .utf8) ?? "Erreur inconnue"
                    errorMessage = "Erreur serveur (\(httpResponse.statusCode)) : \(serverMessage)"
                    showError = true
                }
                
            } catch {
                errorMessage = "Impossible de se connecter au serveur : \(error.localizedDescription)"
                showError = true
            }
        }
    
    
}

struct SignUpController_Previews: PreviewProvider {
    static var previews: some View {
        SignUpController()
    }
}





