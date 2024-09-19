//
//  LoadingView.swift
//  Meteo_IOS
//
//  Created by Anthony Baucal on 18/09/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
