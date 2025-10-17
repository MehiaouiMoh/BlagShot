import SwiftUI

struct JokeGenerationView: View {
    @StateObject var viewModel = JokeGenerationViewModel()
    var selectedCategory: String? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.content.titrePrincipal)
                .font(.largeTitle)
                .bold()
            
            Text(viewModel.content.titreSecondaire)
                .font(.title2)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(viewModel.content.blague)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            HStack(spacing: 40) {
                
                Button(action: {
                    Task {
                        await viewModel.generateJoke(category: selectedCategory)
                    }
                }) {
                    Image(systemName: viewModel.content.btnGenerate)
                        .font(.largeTitle)
                        .rotationEffect(viewModel.isLoading ? Angle(degrees: 360) : Angle(degrees: 0))
                        .animation(viewModel.isLoading ? .linear(duration: 0.8).repeatForever(autoreverses: false) : .default, value: viewModel.isLoading)
                }
                
                Button(action: {
                    // Ajouter
                }) {
                    Image(systemName: viewModel.content.btnAdd)
                        .font(.largeTitle)
                }
                
                Button(action: {
                    // Aller aux favoris
                }) {
                    Image(systemName: viewModel.content.btnFavories)
                        .font(.largeTitle)
                }
            }
            .padding()
        }
        .padding()
    }
}

