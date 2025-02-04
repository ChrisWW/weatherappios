//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Krystian Wiewiór on 03/02/2025.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            VStack {
                Text(weather.name)
                    .bold().font(.title)
                
                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light)
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding()
        }
        ).edgesIgnoringSafeArea(.bottom)
            .background(Color(red: 0.6, green: 0.3, blue: 0.6, opacity: 1.0))
            .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
