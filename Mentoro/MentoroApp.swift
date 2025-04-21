//
//  MentoroApp.swift
//  Mentoro
//
//  Created by MacBookAir on 4/16/25.
//

import SwiftUI
import SwiftData

@main
struct MentoroApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: FavoriteItem.self)
    }
}
