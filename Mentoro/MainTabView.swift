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
                    Text("Mentors")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            
        }
        .background(.ultraThinMaterial)
        .ignoresSafeArea(edges: .bottom)
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
