//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Krystian Wiewiór on 07/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: Weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                try await
                                weatherManager
                                    .getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(red: 0.6, green: 0.3, blue: 0.6, opacity: 1.0))
        .preferredColorScheme(.dark)

    }
}

#Preview {
    ContentView()
}
