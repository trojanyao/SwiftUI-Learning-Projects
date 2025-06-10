//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by 姚陶钧 on 2025/5/29.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
