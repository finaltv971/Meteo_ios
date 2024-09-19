//
//  ContentView.swift
//  Meteo_IOS
//
//  Created by Anthony Baucal on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
	var weatherManager = WeatherManager()
	@State var weather : ResponseBody?
	
	
    var body: some View {
        VStack {
			if let location = locationManager.location{
				if let weather = weather{
					
					WeatherView(weather: weather)
				}else{
					LoadingView().task {
						do{
							 weather = try await weatherManager.getCurrentLocation(lat: location.latitude, lon: location.longitude)
							
						}catch{
							print("Error \(error)")
						}
					}
				}
			}else {
				if locationManager.isLoading{
					LoadingView()
				}else{
					WelcomeView()
						.environmentObject(locationManager)
				}
			}
			
		}.background(Color(red: 0.5, green: 0.5, blue: 0.5))
			.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
