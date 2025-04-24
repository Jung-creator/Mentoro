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
            GridItem(.flexible()),
        ]
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.05)  // 전체 배경
                    .ignoresSafeArea()
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
                                    .frame(
                                        width: width - 32, height: width * 1.2
                                    )
                                    .clipped()  // 이미지가 넘치는 부분 자르기
                                    .cornerRadius(16)
                                LinearGradient(
                                    colors: [
                                        Color.blue, Color.blue.opacity(0.3),
                                        Color.blue.opacity(0),
                                    ],
                                    startPoint: .bottom,
                                    endPoint: .center
                                ).clipShape(
                                    RoundedCorner(
                                        radius: 16,
                                        corners: [.bottomLeft, .bottomRight]))
                                LinearGradient(
                                    colors: [
                                        Color.blue, Color.blue.opacity(0),
                                        .blue.opacity(0),
                                    ],
                                    startPoint: .bottom,
                                    endPoint: .center
                                ).clipShape(
                                    RoundedCorner(
                                        radius: 16,
                                        corners: [.bottomLeft, .bottomRight]))

                                HStack(alignment: .bottom) {
                                    VStack(alignment: .leading) {
                                        Text("오늘도 신나게")
                                            .font(.body.bold())
                                            .foregroundColor(.teal)
                                            .saturation(3)
                                        Text("힙합을 즐기는 Lingo")
                                            .font(.title2.bold())
                                            .foregroundColor(Color.white)

                                    }
                                    Spacer()

                                    NavigationLink(
                                        destination: MentorDetailView(
                                            mentor: mockMentors.first!)
                                    ) {
                                        ZStack {

                                            Text("더 알아보기").bold()
                                                .foregroundColor(Color.blue)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(Color.white)
                                                .cornerRadius(32)
                                        }
                                        .padding(.vertical, -8)
                                        .padding(.horizontal, -8)

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
                            ZStack(alignment: .topLeading) {
                                Color.white
                                    .frame(height: width * 0.65)
                                    .cornerRadius(16)

                                VStack(alignment: .leading) {
                                    VStack(alignment: .leading) {
                                        Text("다른 멘토들은")
                                            .font(.body.bold())
                                            .foregroundStyle(Color.gray)
                                        Text("어떤 것에 관심이 있을까요?")
                                            .font(.title3.bold())
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)

                                    ZStack {
                                        ScrollView(
                                            .horizontal, showsIndicators: false
                                        ) {
                                            HStack {
                                                Spacer()
                                                    .frame(width: 16)
                                                ForEach(mockMentors, id: \.name)
                                                { mentor in
                                                    NavigationLink(
                                                        destination:
                                                            MentorDetailView(
                                                                mentor: mentor)
                                                    ) {
                                                        Image(mentor.imageName)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(
                                                                width: width
                                                                    * 0.21,
                                                                height: width
                                                                    * 0.25
                                                            )
                                                            .clipped()
                                                            .cornerRadius(12)
                                                    }

                                                }

                                            }

                                        }
                                        .padding(.bottom, 8)
                                        LinearGradient(
                                            colors: [
                                                Color.white,
                                                Color.white.opacity(0),
                                                Color.white.opacity(0),
                                                Color.white.opacity(0),
                                            ], startPoint: .leading,
                                            endPoint: .center
                                        ).frame(height: width * 0.28)
                                            .allowsHitTesting(false)
                                        LinearGradient(
                                            colors: [
                                                Color.white,
                                                Color.white.opacity(0),
                                                Color.white.opacity(0),
                                                Color.white.opacity(0),
                                            ], startPoint: .trailing,
                                            endPoint: .center
                                        ).frame(height: width * 0.28)
                                            .allowsHitTesting(false)
                                    }
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            print("Button pressed")
                                        }) {
                                            Image(systemName: "plus.circle")
                                            Text("멘토 추가하기")

                                        }

                                        Spacer()
                                    }
                                    .padding(.top, 8)

                                }
                                .padding(.vertical)

                            }
                            .padding(.bottom, 24)
                            // MARK: Third View
                            VStack(alignment: .leading) {
                                Group {
                                    Text("코드 잘 맞는 멘토를 찾고싶다면")
                                        .font(.body.bold())
                                        .foregroundStyle(Color.gray)
                                    Text("카테고리 구경부터 해보세요")
                                        .font(.title3.bold())
                                }
                                .padding(.horizontal, 8)

                            }

                            LazyVGrid(
                                columns: columns, spacing: 16
                            ) {
                                ForEach(Category.allCases, id: \.self) {
                                    category in
                                    NavigationLink(
                                        destination: CategoryView(
                                            title: category.rawValue)
                                    ) {
                                        VStack {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 64)
                                                    .foregroundStyle(
                                                        Color.white)
                                                Image(systemName: "aqi.low")
                                                    .font(.title)
                                            }
                                            Spacer()
                                                .frame(height: 8)

                                            Text(category.rawValue)
                                                .font(.caption)
                                                .foregroundStyle(Color.gray)

                                            Spacer()
                                                .frame(height: 16)
                                        }
                                    }

                                }
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 48)
                    }
                }
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
