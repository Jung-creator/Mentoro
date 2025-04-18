//
//  MainView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/17/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        NavigationStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height:32)
                        
                        // MARK: First View
                        Text("Title")
                            .font(.title.bold())
                        ZStack(alignment: .bottomLeading) {
                            Color.gray.opacity(0.2)
                                .frame(height: width * 1.2)
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
                        
                        // MARK: Second View
                        ZStack(alignment:.topLeading) {
                            Color.gray.opacity(0.2)
                                .frame(height: width * 0.6)
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
                                            NavigationLink(destination: MentorDetailView()) {
                                                Color.gray.opacity(0.2)
                                                    .frame(width: width * 0.21, height: width * 0.25)
                                                    .cornerRadius(12)
                                            }
                                            
                                            
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
                        .padding(.bottom)
                        // MARK: Third View
                        VStack(alignment: .leading) {
                            Group {
                                Text("Inner Text")
                                    .font(.body.bold())
                                    .foregroundStyle(Color.gray)
                                Text("Inner Text")
                                    .font(.title3.bold())
                            }
                            .padding(.horizontal,8)
                            
                        }
                        
                        LazyVGrid(columns: columns, spacing: 16
                        ) {
                            ForEach(Category.allCases, id: \.self) {
                                category in
                                Button(action: {
                                    print("move to \(category.rawValue)")}) {
                                        VStack {
                                            Image(systemName: "aqi.low")
                                                .font(.title)
                                            Spacer()
                                                .frame(height: 4)
                                            
                                            Text(category.rawValue)
                                                .font(.caption)
                                                .foregroundStyle(Color.gray)
                                                .opacity(0.7)
                                            Spacer()
                                                .frame(height: 16)
                                        }
                                    }
                                
                            }
                        }
                        .padding()
                        }
                        .padding(.horizontal)
                        .padding(.bottom,48)
                    }
                }
            }
        }
    }

#Preview {
    MainView()
}
