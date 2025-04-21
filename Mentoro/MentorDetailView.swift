//
//  MentorDetailView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/18/25.
//

import SwiftUI
import SwiftData

struct MentorDetailView: View {
    @Query var favorites: [FavoriteItem]

    private let mentor: Mentor
    
    init(mentor: Mentor) {
        self.mentor = mentor
    }
    
    var body: some View {
        
        ZStack {
            GeometryReader {
                geometry in
                let width = geometry.size.width
                
                ScrollView {
                    VStack {
                        Spacer()
                            .frame(height: 24)
                        Text(mentor.name.rawValue)
                            .font(.title2.bold())
                        Image(mentor.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 144)
                            .clipShape(Circle())
                        
                        Group {
                            Color.gray
                                .frame(height:1)
                                .opacity(0.2)
                                .padding(.horizontal, width * 0.1)
                            
                            HStack {
                                ImageAndTextView()
                                
                                Rectangle()
                                    .fill(Color.gray)
                                    .opacity(0.2)
                                    .frame(width: 1, height: 32)
                                ImageAndTextView()
                                Rectangle()
                                    .fill(Color.gray)
                                    .opacity(0.2)
                                    .frame(width: 1, height: 32)
                                ImageAndTextView()
                            }
                            Color.gray
                                .frame(height:1)
                                .opacity(0.2)
                                .padding(.top,4)
                                .padding(.horizontal, width * 0.1)
                            
                        }
                        
                        // MARK: 저장된 Favorites 보여주기
                        Text(favorites.map {$0.chipLabel.rawValue}.joined(separator: ", "))
                        
                        Spacer()
                            .frame(height: 32)
                        ChipLayoutView(chipLabels: mentor.interests, mentorName: mentor.name, isFavorite: .constant(false), width: width * 0.85)
                    }
                    .padding(.bottom, 80)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            
                            NavigationLink("Edit", destination: EditView())
                        }
                    }
                }
            }
            LinearGradient(colors: [Color.white, Color.white.opacity(0), Color.white.opacity(0)], startPoint: .bottom, endPoint: .center)
                .allowsHitTesting(false)
                .ignoresSafeArea()
        }
    }
}

struct ImageAndTextView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.title)
                .foregroundColor(.gray)
                .opacity(0.3)
                .padding(.all,8)
            Text("title")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .opacity(0.5)
        }.padding(.horizontal)
    }
}

#Preview {
    MentorDetailView(mentor: mockMentors[7])
}
