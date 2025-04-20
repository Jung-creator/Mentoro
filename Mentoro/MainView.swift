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
        
        GeometryReader { geometry in
            let width = geometry.size.width
            
            ScrollView {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 16)
                    
                    // MARK: First View
                    HStack {
                        Spacer()
                            .frame(width: 8)
                        Text("오늘의 멘토")
                    }
                    
                        .font(.title.bold())
                    ZStack(alignment: .bottomLeading) {
                        Image("lingo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: width - 32,height: width * 1.2)
                            .clipped() // 이미지가 넘치는 부분 자르기
                            .cornerRadius(16)
                        LinearGradient(
                            colors: [Color.blue, Color.blue.opacity(0.3),Color.blue.opacity(0)],
                            startPoint: .bottom,
                            endPoint: .center
                        ).clipShape(RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight]))
                        LinearGradient(
                            colors: [Color.blue, Color.blue.opacity(0),.blue.opacity(0)],
                            startPoint: .bottom,
                            endPoint: .center
                        ).clipShape(RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight]))
                        
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text("어느 날 갑자기")
                                    .font(.body.bold())
                                    .foregroundColor(.teal)
                                    .saturation(3)
                                Text("피아노가 생긴 Lingo")
                                    .font(.title2.bold())
                                    .foregroundColor(Color.white)
                                
                            }
                            Spacer()
                            Button(action: {
                                print("Button pressed")
                            }) {
                                Text("더보기").bold()

                            }
                            .foregroundStyle(Color.accentColor)
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
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
                            NavigationLink(destination: CategoryView(title: category.rawValue)) {
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



struct RoundedCorner: Shape {
    var radius: CGFloat = 16.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    MainView()
}
