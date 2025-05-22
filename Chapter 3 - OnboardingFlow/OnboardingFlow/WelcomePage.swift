//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by 姚陶钧 on 2025/5/1.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
            
            Text("Welcome to my App")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Description text here for placeholder sample")
                .font(.title2)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}
