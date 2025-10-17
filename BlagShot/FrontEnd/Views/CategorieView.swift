//
//  CategorieView.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//

import SwiftUI
import UIKit

struct CategorieView: View {
    let content : CategoriesContent
    
    var onTapHome: () -> Void
    var onTapAdd: () -> Void
    var onTapFavories: () -> Void
    
    @State private var navigateToJokeGenerator = false
    @State private var selectedCategory: String? = nil
    
    var body: some View {
        ZStack {
            VStack(spacing: 20 ){
                // HEADER
                HStack(spacing: 10){
                    Image(systemName: content.imageCible)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.blue))
                    
                    Text(content.titrePrincipal)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                
                // TITRE SECONDAIRE AVEC TRAITS
                HStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                    
                    Text(content.titreSecondaire)
                        .font(.system(size: 20, weight: .bold))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                }
                .padding(.vertical, 10)
                
                
                // CATEGORIES EN QUINCONCE
                ZStack {
                    // Image centrale
                    if let uiImage = UIImage(named: content.imagePrincipale) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .padding(20)
                            .frame(width: 190, height: 190)
                            .offset(x: 100, y: 40)
                    } else {
                        Text("Image introuvable")
                            .foregroundColor(.red)
                    }
                     // décalé à droite
                    
                    // Catégories en quinconce (manuelles)
                    if content.categories.count > 0 {
                        CategoryCircle(title: content.categories[0], onTap: categoryTapped)
                            .offset(x: -100, y: -150)
                    }
                    if content.categories.count > 1 {
                        CategoryCircle(title: content.categories[1], onTap: categoryTapped)
                            .offset(x: 30, y: -110)
                    }
                    if content.categories.count > 2 {
                        CategoryCircle(title: content.categories[2], onTap: categoryTapped)
                            .offset(x: -90, y: 0)
                    }
                    if content.categories.count > 3 {
                        CategoryCircle(title: content.categories[3], onTap: categoryTapped)
                            .offset(x: -20, y: 150)
                    }
                    if content.categories.count > 4 {
                        CategoryCircle(title: content.categories[4],onTap: categoryTapped)
                            .offset(x: 100, y: 220)
                    }
                }
                .frame(height: 400)
                
                Spacer()
                
                // Bouton pour blague aléatoire
                Button(action: {
                    selectedCategory = nil
                    navigateToJokeGenerator = true
                }) {
                    Text("Générer une blague aléatoire ?")
                        .foregroundColor(.blue)
                        .underline()
                }
                .padding()
                Spacer()
                
                // BARRE DU BAS AVEC BOUTONS
                HStack {
                    Spacer()
                    
                    Button(action: onTapHome) {
                        Image(systemName: content.btnAcceuil)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: onTapAdd) {
                        Image(systemName: content.btnAdd)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: onTapFavories) {
                        Image(systemName: content.btnFavories)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
        .navigationDestination(isPresented: $navigateToJokeGenerator) {
            JokeGenerationView(selectedCategory: selectedCategory)
        }
    }
    private func categoryTapped(_ category: String) {
        selectedCategory = category
        navigateToJokeGenerator = true
    }
}


/// UNE CATÉGORIE EN CERCLE
struct CategoryCircle: View {
    let title: String
    let onTap: (String) -> Void
    
    var body: some View {
        Button(action: { onTap(title) }) {  // <- ici
            VStack {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 90, height: 90)
                    .overlay(
                        Image(systemName: "face.smiling")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                    )
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
        .buttonStyle(PlainButtonStyle()) // pour supprimer le style par défaut
    }
}


