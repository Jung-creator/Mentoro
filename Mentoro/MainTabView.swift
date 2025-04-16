//
//  ContentView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/16/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                }
            
        }
    }
}

struct MainView: View {
    var body: some View {
        Text("Main")
    }
}

struct FavoriteView: View {
    var body: some View {
        Text("Favorite")
    }
}

#Preview {
    MainTabView()
}
