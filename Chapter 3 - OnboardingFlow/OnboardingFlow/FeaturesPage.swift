//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by 姚陶钧 on 2025/5/1.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(
                iconName: "person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left."
            )
            
            FeatureCard(
                iconName: "quote.bubble.fill",
                description: "Short summary."
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
}
