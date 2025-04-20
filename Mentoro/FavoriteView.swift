//
//  FavoriteView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/17/25.
//

import SwiftUI

struct FavoriteView: View {
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
                    Text("Title")
                        .font(.title.bold())
                    ScrollView {
                        ForEach(0..<4) {
                            _ in
                            
                            NavigationLink(destination: MentorDetailView(mentor: mockMentors.first!)) {
                                FavoriteCardItem(width: width)
                            }
                            
                            
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}


struct FavoriteCardItem: View {
    private  let width: Double
    init(width: Double) {
        self.width = width
    }
    
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            Color.gray
                .opacity(0.2)
                .frame(height: width * 0.25)
                .cornerRadius(16)
            HStack(alignment: .top) {
                Color.gray
                    .opacity(0.2)
                    .frame(width: width * 0.25 - 16, height: width * 0.25 - 16)
                    .cornerRadius(12)
                VStack(alignment: .leading) {
//                    Spacer()
//                        .frame(height:4)
                    HStack {
                        Text("Name")
                            .font(.body.bold())
                        Image(systemName: "chevron.forward")
                            .font(.caption)
                        Spacer()
                        Text("Part")
                            .font(.caption.bold())
                            .foregroundStyle(Color.gray)
                    }
                    .padding(.top, 2)
                    .padding(.bottom,width < 400 ? -2 : 0)
                    .padding(.trailing)
//                    .background(Color.gray)
                    
                    ChipLayoutView(chipLabels: [.자료구조, .추상화, .객체지향, .아키텍처, .코드가독성, .유지보수, .리팩토링], isFavorite: .constant(true), width: width * 0.66
                    )
//                    .background(Color.gray)
                    
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
