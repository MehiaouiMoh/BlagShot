//
//  JokeGenerationController.swift
//  BlagShot
//
//  Created by admin on 27/09/2025.
//
import SwiftUI

struct JokeGenerationController: View {
    @State private var navigateToSignUp = false
    @State var content = JokesGenerationContent(
        titrePrincipal: "Fait toi plaisir",
        titreSecondaire: "Blagues",
        blague: "",
        imagePrincipale: "",
        btnAddFavories: "heart",
        btnGenerate: "",
        btnAdd: "plus.circle",
        btnFavories: "heart"
    )
}
