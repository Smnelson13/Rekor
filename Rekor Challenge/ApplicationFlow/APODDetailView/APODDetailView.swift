//
//  APODDetailView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/15/22.
//

import SwiftUI

struct APODDetailView: View {
    
    let apod: APOD
    let imageSize: CGFloat = 300
    let defaults = UserDefaults.standard
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: apod.hdImageURL ?? apod.imageURL)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame(height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "Error Loading Image...")
                            .foregroundColor(Color.red)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView().frame(width: imageSize, height: imageSize)
                    }
                }
                
                VStack(alignment: .center, spacing: 15) {
                    Text(apod.title).font(.headline)
                    Text(apod.explanation).font(.footnote).padding()
                    Text(apod.date)
                    
                    Button("Add To Favorites", action: favoriteAPOD)
                        .padding()
                        .frame(width: 300, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(15, antialiased: true)
                }
            }
        }
    }
    
    private func favoriteAPOD() {
        print("Current APOD - \(apod)")
        if let encoded = try? JSONEncoder().encode(apod) {
            defaults.set(encoded, forKey: Keys.favoritesKey)
        }
    }
}

struct APODDetailView_Previews: PreviewProvider {
    static var previews: some View {
        APODDetailView(apod: APOD.MockAPOD())
    }
}
