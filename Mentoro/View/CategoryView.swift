//
//  CategoryView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/18/25.
//

import SwiftUI

struct CategoryView: View {
    let title: String
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 32)
                Text(title)
                    .font(.title.bold())
                    .padding(.bottom)
                ForEach(0..<5) {
                    _ in
                    ImageScrollView(subtitle: "subtitle")
                }
                
            }
            .padding()
        }
    }
}

struct ImageScrollView: View {
    private let subtitle: String
    
    init(subtitle: String) {
        self.subtitle = subtitle
    }
    
    
    var body: some View {
        Text(subtitle)
            .font(.title3.bold())
            .foregroundStyle(Color.gray)
            .opacity(0.5)
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<7) {
                    _ in NavigationLink(destination: MentorDetailView(mentor: mockMentors.first!)) {
                        Circle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .frame(width:80)
                    }
                        
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    CategoryView(title: "개발")
}
