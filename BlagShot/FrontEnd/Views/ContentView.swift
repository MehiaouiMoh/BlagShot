//
//  ContentView.swift
//  BlagShot
//
//  Created by admin on 26/09/2025.
//
import SwiftUI
import UIKit

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView: View {
    let content: HomeContent
    var onButtonTap: () -> Void
    
    var body: some View {
        ZStack {
            Color(hex: "FFE01A").ignoresSafeArea(edges: .all)
            
            VStack(spacing: 20) {
                Text(content.TitrePrincipal)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(content.Accroche)
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                
                if let uiImage = UIImage(named: "laughing_face") {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                } else {
                    Text("Image introuvable")
                        .foregroundColor(.red)
                }
                
                Text(content.paragraphe)
                
                Button(action: onButtonTap) {
                    Text(content.buttonTitle)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
            }
            .padding()
        }
    }
}

