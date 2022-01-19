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
    
    @StateObject private var store = APODDetailViewStore()
    @State private var currentScale: CGFloat = 0
    @State private var finalScale: CGFloat = 1
    
    var body: some View {
        NavigationView {
            if store.isLoading {
                LoadingView()
            } else if store.errorMessage != nil {
                ErrorView(errorMessage: "Already in favorites.")
            } else {
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
                        }.scaleEffect(finalScale + currentScale)
                            .gesture(
                                MagnificationGesture().onChanged({ scale in
                                    currentScale = scale
                                })
                                    .onEnded({ scale in
                                        finalScale = scale
                                        currentScale = 0
                                    })
                            )
                        
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
                    }.alert(isPresented: store.isPresentingAlert, content: {
                        Alert(localizedError: store.activeError!)
                    })
                }
            }

        }
    }
    
    func favoriteAPOD() {
        store.favoriteAPOD(apod)
    }
}

struct APODDetailView_Previews: PreviewProvider {
    static var previews: some View {
        APODDetailView(apod: APOD.MockAPOD())
    }
}
