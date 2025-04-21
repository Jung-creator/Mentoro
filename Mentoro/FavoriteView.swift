//
//  FavoriteView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/17/25.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Query var favorites: [FavoriteItem]
    
    var groupedFavorites: [MentorName : [SubCategory]] {
        Dictionary(grouping: favorites, by: \.mentorName)
            .mapValues { $0.map(\.chipLabel) }
    }
    
    var body: some View {
        
        ZStack {
            Color.gray.opacity(0.05) // 전체 배경
                .ignoresSafeArea()
            GeometryReader {
                geometry in
                let width = geometry.size.width
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        Spacer()
                            .frame(width: 8)
                        Text("나의 관심 목록")
                            .font(.title2.bold())
                        //                        Text("keys: \(groupedFavorites.keys.count)")
                    }
                    ScrollView {
                        ForEach(groupedFavorites.keys.sorted(), id: \.self) {
                            mentorName in
                            
                            NavigationLink(
                                destination:
                                    
                                    MentorDetailView(mentor: mockMentors.first(where: { $0.name == mentorName })!)
                                
                            ) {
                                if let chips = groupedFavorites[mentorName] {
                                    FavoriteCardItem(width: width, mentorName: mentorName, chipLabels: chips)
                                } else {
                                    Text("no chips")
                                }
                            }
                        }
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}


struct FavoriteCardItem: View {
    let width: Double
    let mentorName: MentorName
    let chipLabels: [SubCategory]
    
    init(width: Double, mentorName: MentorName, chipLabels: [SubCategory]) {
        self.width = width
        self.mentorName = mentorName
        self.chipLabels = chipLabels
    }
    
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            Color.white
                .frame(height: width * 0.25)
                .cornerRadius(16)
            HStack(alignment: .top) {
                Image(mentorName.rawValue.lowercased())
                    .resizable()
                    .scaledToFill()
                    .frame(width: width * 0.25 - 16, height: width * 0.25 - 16)
                    .clipped()
                    .cornerRadius(12)
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                            .frame(width: 4)
                        Text(mentorName.rawValue)
                            .foregroundColor(.black)
                            .font(.body.bold())
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.black)
                            .font(.caption)
                        Spacer()
                        Text("Part")
                            .font(.caption.bold())
                            .foregroundStyle(Color.gray)
                    }
                    .padding(.top, 2)
                    .padding(.bottom,width < 400 ? -2 : 0)
                    .padding(.trailing)
                    
                    
                    ChipLayoutView(chipLabels: chipLabels, mentorName: mentorName, isFavorite: .constant(true), width: width * 0.66
                    )
                    
                }
                
            }
            .padding(.horizontal,8)
            //            .padding(.top,8)
            //            .frame(height: 60)
        }
        // ZStack의 크기를 정해주는 것이 중요
        .frame(height: width * 0.25)
    }
}

#Preview {
    FavoriteView()
}
