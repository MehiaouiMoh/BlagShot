//
//  CategoriesController.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//
import SwiftUI

struct CategoriesController: View {
    @State private var navigateToHome = false
    @State private var navigateToAdd = false
    @State private var navigateToFavories = false
    @State var content = CategoriesContent(
        imageCible: "target",
        titrePrincipal: "Choisis une catégorie !",
        titreSecondaire: "Catégories",
        categories: ["Animaux","Communauté","Ecole","Chuck Norris","RER B"],
        imagePrincipale: "choiceCategory",
        btnAcceuil: "house",
        btnAdd: "plus.circle",
        btnFavories: "heart",
    )
    
    @State private var showError = false
    var body: some View {
        CategorieView(content: content,
                      onTapHome: {navigateToHome = true},
                      onTapAdd: {navigateToAdd = true},
                      onTapFavories: {navigateToFavories = true}
        )
        .navigationDestination(isPresented: $navigateToHome) {
            CategoriesController()
        }
        .navigationDestination(isPresented: $navigateToAdd) {
            /*AddController()*/
        }
        .navigationDestination(isPresented: $navigateToFavories) {
            /*SignUpController()*/
        }
    }
}

struct CategoriesController_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesController()
    }
}
