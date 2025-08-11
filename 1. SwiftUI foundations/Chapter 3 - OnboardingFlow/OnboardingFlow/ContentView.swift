//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by 姚陶钧 on 2025/5/1.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
                .tabItem {
                    Text("首页")
                    Image(systemName: "tray.full")
                }
            FeaturesPage()
                .tabItem {
                    Text("我的")
                }
        }
        .background(Gradient(colors: gradientColors))
//        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
