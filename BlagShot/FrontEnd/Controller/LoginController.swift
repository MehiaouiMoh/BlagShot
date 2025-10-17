//
//  LoginController.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//
import SwiftUI

struct LoginController: View {
    @State private var navigateToSignUp = false
    @State private var goToHome = false
    @State private var navigateToAddJokes = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var userName = ""
    
    @State var content = LoginContent(
        skip: "Skip",
        grandTitre: "Un humoriste dans l'âme ?",
        accroche: "Prouve nous ça !",
        imageName: "LoginImg",
        emailLabel: "Email",
        pwdLabel: "Password",
        signInButton: "Sign In",
        titleRedirection: "Wesh pas de compte ?",
        linkRedirection: "Créer en un !"
    )
    
    
    
    var body: some View {
        LoginView(content: $content,
                  onButtonTap: {
                      Task {
                          await handleLogin()
                      }
                }
                  ,
                  onRedirectTap: {
                      navigateToSignUp = true   // 🔑 déclenche la navigation vers SignUp
                  },
                  skiplogin:{
                    goToHome = true
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
        .navigationDestination(isPresented: $goToHome){
            CategoriesController()
        }
        .navigationDestination(isPresented: $navigateToAddJokes ){
            AddJokeController(userName: userName)
        }

    }
    
    private func handleLogin() async {
        guard !content.email.isEmpty, !content.password.isEmpty else {
            errorMessage = "Email et mot de passe sont obligatoires"
            showError = true
            return
        }

        guard let url = URL(string: "http://localhost:8080/api/users/login") else {
            errorMessage = "URL invalide"
            showError = true
            return
        }

        let body: [String: String] = [
            "email": content.email,
            "password": content.password
        ]
        
        print("body créé")
        
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print("JSON envoyé :", String(data: jsonData, encoding: .utf8)!)
            request.httpBody = jsonData

            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }

            if httpResponse.statusCode == 200 {
                // 🔐 Connexion réussie
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let name = json["name"] as? String{
                    print("✅ Réponse API :", json)
                    userName = name
                    // Redirection vers la page de blagues
                    navigateToAddJokes = true
                }
                
            } else {
                // ❌ Erreur (mauvais identifiants, etc.)
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let message = json["message"] as? String {
                    errorMessage = message
                } else {
                    errorMessage = "Échec de la connexion. Vérifie tes identifiants."
                }
                showError = true
            }

        } catch {
            print("Erreur :", error.localizedDescription)
            errorMessage = "Impossible de se connecter au serveur."
            showError = true
        }
    }
}

struct LoginController_Previews: PreviewProvider {
    static var previews: some View {
        LoginController()
    }
}

