//
//  ContentView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/16/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
//        NavigationStack {
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

//        }
    }
}



#Preview {
    MainTabView()
}
