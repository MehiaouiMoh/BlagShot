import Foundation
import SwiftUI

@MainActor
class JokeGenerationViewModel: ObservableObject {
    @Published var content = JokesGenerationContent(
        titrePrincipal: "Fais-toi plaisir",
        titreSecondaire: "Blagues",
        blague: "",
        imagePrincipale: "",
        btnAddFavories: "heart",
        btnGenerate: "dice.fill",
        btnAdd: "plus.circle",
        btnFavories: "heart"
    )
    
    @Published var isLoading = false
    
    func generateJoke(category: String? = nil) async {
        var route = (category == nil) ? "random" : "custom"
        
        
        let body: [String: Any]
        
        if let category = category {
            route = "customs"
            body = [
                "category": category,
                "type": "twopart",
                "safe": false,
                "lang": "fr",
                "flags": [
                    "nsfw": false,
                    "religious": true,
                    "political": true,
                    "racist": false,
                    "sexist": true,
                    "explicit": true
                ]
            ]
        } else {
            route = "random"
            body = [
                "lang": "fr"
            ]
        }
        
        guard let url = URL(string: "http://localhost:8080/jokes/\(route)") else { return }
        
        do {
            DispatchQueue.main.async { self.isLoading = true }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // ✅ Affiche la réponse brute en JSON dans le terminal
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Réponse brute de l'API : \(jsonString)")
            }
            
            let joke = try JSONDecoder().decode(Joke.self, from: data)
            
            DispatchQueue.main.async {
                let setup = joke.setup ?? ""       // si nil, remplace par ""
                let delivery = joke.delivery ?? ""
                self.content.blague = "\(setup)\n\n\(delivery)"
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.content.blague = "Erreur lors de la génération de la blague"
                self.isLoading = false
            }
            print("Erreur API: \(error)")
        }
    }
    
}

struct JokeGenerationView_Previews: PreviewProvider {
    static var previews: some View {
        JokeGenerationView()
    }
}

