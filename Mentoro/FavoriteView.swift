//
//  FavoriteView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/17/25.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
//        let columns = [GridItem(.adaptive(minimum: 50), spacing: 4)]
        
        let items = ["100", "2000", "30000", "4000", "50", "600", "7000", "8000"]
        
        GeometryReader { geometry in
            let width = geometry.size.width
            
            
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 16)
                Text("Title")
                    .font(.title.bold())
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
                            Spacer()
                                .frame(height:4)
                            HStack {
                                Text("Name")
                                    .font(.body.bold())
                                Spacer()
                                Text("Part")
                                    .font(.caption.bold())
                                    .foregroundStyle(Color.gray)
                            }.padding(.trailing)
                            Spacer()
                            Text("text")
                                .padding(.bottom)
                            
                        }
                        
                    }
                    .padding(.horizontal,8)
                    .padding(.top,8)
                }
                // ZStack의 크기를 정해주는 것이 중요
                .frame(height: width * 0.25)

            }
            .padding()
        }
    }
}

#Preview {
    FavoriteView()
}
