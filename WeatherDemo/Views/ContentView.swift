//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Krystian Wiewiór on 07/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
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
