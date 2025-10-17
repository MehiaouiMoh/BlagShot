//
//  AddJokeView.swift
//  BlagShot
//
//  Created by admin on 17/10/2025.
//

import SwiftUI
import UIKit

struct AddJokeView: View {
    @Binding var content: AddJokeContent
    
    var onButtonTap: () -> Void
    
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
                    
                    Text(content.titrePrincipal)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                
                HStack(spacing: 10){
                    
                    Text(content.titreSecondaire)
                        .font(.system(size: 20, weight: .bold))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                }
                
                Button(action: onButtonTap) {
                    Text(content.btnCreate)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                
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
        }
    }
}
