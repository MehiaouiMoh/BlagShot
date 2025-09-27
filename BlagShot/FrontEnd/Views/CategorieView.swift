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
                    Circle()
                        .strokeBorder(Color.black, lineWidth: 8)
                        .background(Circle().fill(Color.blue.opacity(0.2)))
                        .frame(width: 160, height: 160)
                        .overlay(
                            Image(content.imagePrincipale)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .padding(20)
                        )
                        .offset(x: 100) // décalé à droite
                    
                    // Catégories en quinconce (manuelles)
                    if content.categories.count > 0 {
                        CategoryCircle(title: content.categories[0])
                            .offset(x: -100, y: -180)
                    }
                    if content.categories.count > 1 {
                        CategoryCircle(title: content.categories[1])
                            .offset(x: -50, y: -90)
                    }
                    if content.categories.count > 2 {
                        CategoryCircle(title: content.categories[2])
                            .offset(x: -100, y: 0)
                    }
                    if content.categories.count > 3 {
                        CategoryCircle(title: content.categories[3])
                            .offset(x: -50, y: 100)
                    }
                    if content.categories.count > 4 {
                        CategoryCircle(title: content.categories[4])
                            .offset(x: -100, y: 200)
                    }
                }
                .frame(height: 400)
                
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
    }
}


/// UNE CATÉGORIE EN CERCLE
struct CategoryCircle: View {
    let title: String
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.orange)
                .frame(width: 90, height: 90)
                .overlay(
                    Image(systemName: "face.smiling") // Icône par défaut
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
}

