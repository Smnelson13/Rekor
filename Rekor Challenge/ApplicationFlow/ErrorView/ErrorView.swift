//
//  ErrorView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/14/22.
//

import SwiftUI

struct ErrorView: View {
    
    var errorMessage: String
    
    var body: some View {
        VStack {
            Text("🤷‍♂️").font(.system(size: 100))
            Text(errorMessage)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "Generic Error Message")
    }
}
