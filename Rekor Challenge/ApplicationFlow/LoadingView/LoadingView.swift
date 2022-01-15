//
//  LoadingView.swift
//  Rekor Challenge
//
//  Created by Shane Nelson on 1/14/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("🌎").font(.system(size: 100))
            ProgressView()
            Text("Loading Images ...").foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
