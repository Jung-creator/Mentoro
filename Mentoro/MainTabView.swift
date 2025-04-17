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
        .background(.ultraThinMaterial)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MainView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height:32)
                Text("Title")
                    .font(.title.bold())
                ZStack(alignment: .bottomLeading) {
                    Color.gray.opacity(0.2)
                        .frame(height: 450)
                        .cornerRadius(16)
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("Inner Text")
                                .font(.body.bold())
                                .foregroundStyle(Color.gray)
                            Text("Inner Text")
                                .font(.title3.bold())
                            
                        }
                        Spacer()
                        Button(action: {
                            print("Button pressed")
                        }) {
                            Text("See more")
                            
                        }
                        .buttonStyle(.bordered)
                        .cornerRadius(20)
                    }
                    .padding()
                    .padding(.bottom, 8)
                    
                }
                .padding(.bottom)
                
                ZStack(alignment:.topLeading) {
                    Color.gray.opacity(0.2)
                        .frame(height: 240)
                        .cornerRadius(16)
                    
                    VStack(alignment: .leading) {
                        Text("Inner Text")
                            .font(.body.bold())
                            .foregroundStyle(Color.gray)
                        Text("Inner Text")
                            .font(.title3.bold())
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach (0..<5) { _ in
                                    Color.gray.opacity(0.2)
                                        .frame(width: 80, height: 100)
                                        .cornerRadius(12)
                                }
                                
                            }
                            
                        }
                        .padding(.bottom,8)
                        HStack {
                            Spacer()
                            Button(action: {
                                print("Button pressed")
                            }) {
                                Image(systemName: "plus.circle")
                                Text("See more")
                                
                            }
                            
                            Spacer()
                        }
                        
                        
                    }
                    .padding()
                    .padding(.top, 8)
                    
                    
                }
                
                VStack(alignment: .leading) {
                    Group {
                        Text("Inner Text")
                            .font(.body.bold())
                            .foregroundStyle(Color.gray)
                        Text("Inner Text")
                            .font(.title3.bold())
                    }
                    .padding(.horizontal,8)

                    
                    ForEach (Category.allCases, id:\.self) { category in Button(action: {
                        print("move to \(category.rawValue)")
                    }
                        
                        ) {
                        ZStack(alignment: .leading) {
                            Color.gray
                                .opacity(0.2)
                                .frame(height: 80)
                                .cornerRadius(16)
                            
                            HStack {
                                Text(category.rawValue.uppercased())
                                    .font(.title3.bold())
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical, -1)
                    }
                        
                    }
                }
                .padding(.top)

                
            }
            .padding(.horizontal)
        }
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
