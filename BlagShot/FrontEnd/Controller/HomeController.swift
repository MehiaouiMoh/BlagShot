//
//  HomeController.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//
import SwiftUI

struct HomeController: View {
    @State private var navigateToLogin = false
    
    private let content = HomeContent(
        TitrePrincipal: "Blagshot",
        Accroche: "Entre potos, pas d'embrouilles, que des barres",
        paragraphe: "Chope ta blague, écris en une et vote pour celles qui font le plus rire !",
        buttonTitle: "Démarre ça frère !"
    )
    
    var body: some View {
        ContentView(content: content) {
            navigateToLogin = true
        }
        .navigationDestination(isPresented: $navigateToLogin) {
            LoginController()
        }
    }
}

