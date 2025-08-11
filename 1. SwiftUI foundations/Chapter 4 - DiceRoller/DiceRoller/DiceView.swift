//
//  DiceView.swift
//  DiceRoller
//
//  Created by 姚陶钧 on 2025/5/20.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            
            Button(action: {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }) {
                Image(systemName: "die.face.\(numberOfPips).fill")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.black, .white)
            }
            
        }
    }
}

#Preview {
    DiceView()
}
