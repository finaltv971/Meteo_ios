//
//  WelcomeView.swift
//  Meteo_IOS
//
//  Created by Anthony Baucal on 18/09/2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to the weather app").bold().font(.title)
                Text("please share your current location").padding()
            }.multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(30)
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}

