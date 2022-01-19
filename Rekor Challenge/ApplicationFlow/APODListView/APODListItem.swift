//
//  APODListItem.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/15/22.
//

import SwiftUI

struct APODListItem: View {
    
    let apod: APOD
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: apod.imageURL)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .clipped()
                    
                 } else if phase.error != nil {
                     
                     Text(phase.error?.localizedDescription ?? "error")
                         .foregroundColor(Color.pink)
                         .frame(width: imageSize, height: imageSize)
                 } else {
                    ProgressView()
                         .frame(width: imageSize, height: imageSize)
                 }
                
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(apod.title).font(.headline)
            }
        }
    }
}

struct APODListItem_Previews: PreviewProvider {
    static var previews: some View {
        APODListItem(apod: APOD.MockAPOD())
    }
}
