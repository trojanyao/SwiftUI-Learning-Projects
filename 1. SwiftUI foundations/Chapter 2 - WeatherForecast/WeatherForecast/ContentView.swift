//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 姚陶钧 on 2025/4/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Dayforecast(day: "Mon", isRainy: true, high: 70, low: 50)
            
            Dayforecast(day: "Tue", isRainy: false, high: 60, low: 40)
        }
    }
}

#Preview {
    ContentView()
}

struct Dayforecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            "cloud.rain.fill"
        } else {
            "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            Color.blue
        } else {
            Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            Text("High \(high)º")
                .fontWeight(Font.Weight.semibold)
            Text("Low \(low)º")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}
