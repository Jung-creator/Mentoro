//
//  MentorDetailView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/18/25.
//

import SwiftUI

struct MentorDetailView: View {
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                    .frame(height: 24)
                Text("Name")
                    .font(.title2.bold())
                Circle()
                    .fill(Color.gray)
                    .opacity(0.2)
                    .frame(width: 144)
                    .padding(.bottom)

                Group {
                    Color.gray
                        .frame(height:1)
                        .opacity(0.2)
                                    
                    HStack {
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
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .frame(width: 1, height: 32)
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
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .frame(width: 1, height: 32)
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
                    Color.gray
                        .frame(height:1)
                        .opacity(0.2)
                        .padding(.top,4)
                }.padding(.horizontal,32)
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        print("Edit tapped")
                    }
                }
            }
        }
    }
}

#Preview {
    MentorDetailView()
}
