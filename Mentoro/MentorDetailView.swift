//
//  MentorDetailView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/18/25.
//

import SwiftUI

struct MentorDetailView: View {
    private let mentor: Mentor
    
    init(mentor: Mentor) {
        self.mentor = mentor
    }
    
    
    
    var body: some View {
        
//        let interests = mentor.interests.map { $0.rawValue }
        
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
                    Spacer()
                        .frame(height: 32)
                    ChipLayoutView(chipLabels: mentor.interests, isFavorite: .constant(false), width: width * 0.85)
                }.toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        
                        NavigationLink("Edit", destination: EditView())
                    }
                }
            }
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
