//
//  AddJokeController.swift
//  BlagShot
//
//  Created by admin on 17/10/2025.
//
import SwiftUI

// MARK: - Controller
struct AddJokeController: View {
    
    let userName: String
    
    @State private var navigateToHome = false
    @State private var navigateToAdd = false
    @State private var navigateToFavories = false
    @State private var navigateToWriteJoke = false
    @State private var content : AddJokeContent
        
    // Initialisateur
    init(userName: String) {
            self.userName = userName
            self._content = State(initialValue: AddJokeContent(
                titrePrincipal: "Dans la zone 😎",
                titreSecondaire: "Bienvenue \(userName)", // <- nom dynamique
                btnCreate: "Créer une blague",
                btnAcceuil: "house",
                btnGenerate: "dice.fill",
                btnAdd: "plus.circle",
                btnFavories: "heart"
            ))
        }
    
    
    var body: some View {
        AddJokeView(
            content: $content,          // <- binding pour mise à jour possible
            onButtonTap: {
                print("Créer une blague tapped")
                navigateToWriteJoke = true
            },
            onTapHome: {
                print("Home tapped")
                navigateToHome = true
            },
            onTapAdd: {
                print("Add tapped")
                navigateToAdd = true
            },
            onTapFavories: {
                print("Favories tapped")
                navigateToFavories = true
            }
        )
        .navigationTitle("BlagShot")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToHome){
            CategoriesController()
        }
        .navigationDestination(isPresented: $navigateToAdd){
            AddJokeController(userName: userName)
        }
        
    }
}
