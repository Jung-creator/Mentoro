//
//  Enums.swift
//  Mentoro
//
//  Created by MacBookAir on 4/16/25.
//

import SwiftUI


enum Name: String, CaseIterable {
    case Dora
    case Gommin
    case Daisy
    case Nathan
    case Lumi
    case Leeo
    case Lingo
    case Saya
    case Sup
    case Isaac
    case MK
    case Jason
    case Judy
    case Jiku
    case Friday
    case Howard
}

enum Field: String, CaseIterable {
    case 개발
    case 디자인
    case 비즈니스
    case 러닝디벨롭먼트
}


enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }

    case 개발, 디자인, 비즈니스, 소프트스킬, 게임, 스포츠, 음식, 음악, 콘텐츠

        var subCategories: [SubCategory] {
            SubCategory.allCases.filter { $0.category == self }
    }

    var color: Color {
        switch self {
        case .개발: return Color.blue
        case .디자인: return Color.pink
        case .비즈니스: return Color.orange
        case .소프트스킬: return Color.purple
        case .게임: return Color.green
        case .스포츠: return Color.red
        case .음식: return Color.teal
        case .음악: return Color.indigo
        case .콘텐츠: return Color.brown
        }
    }
}


enum SubCategory: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }

    // 개발
    case 자료구조, 알고리즘, 추상화, 객체지향, 함수형프로그래밍

    // 디자인
    case UX설계, 디자인시스템, 프로토타이핑, UI디자인, 컬러시스템

    // 비즈니스
    case PM, 서비스기획, 비즈니스전략, MVP전략, 브랜딩

    // 소프트스킬
    case 마음관리, 오너쉽, 메타인지, 습관형성, 평생학습

    // 게임
    case LOL, TFT, WOW, FC24, 오버워치

    // 스포츠
    case 축구, 풋살, 야구, 농구, 배구

    // 음식
    case 치킨, 피자, 떡볶이, 마라탕, 햄버거

    // 음악
    case 팝, 락, Kpop, 힙합, 클래식

    // 콘텐츠
    case 육아, 연애, 결혼, 자기계발, 건강

    var category: Category {
        switch self {
        case .자료구조, .알고리즘, .추상화, .객체지향, .함수형프로그래밍:
            return .개발

        case .UX설계, .디자인시스템, .프로토타이핑, .UI디자인, .컬러시스템:
            return .디자인

        case .PM, .서비스기획, .비즈니스전략, .MVP전략, .브랜딩:
            return .비즈니스

        case .마음관리, .오너쉽, .메타인지, .습관형성, .평생학습:
            return .소프트스킬

        case .LOL, .TFT, .WOW, .FC24, .오버워치:
            return .게임

        case .축구, .풋살, .야구, .농구, .배구:
            return .스포츠

        case .치킨, .피자, .떡볶이, .마라탕, .햄버거:
            return .음식

        case .팝, .락, .Kpop, .힙합, .클래식:
            return .음악

        case .육아, .연애, .결혼, .자기계발, .건강:
            return .콘텐츠
        }
    }
    
    var displayName: String {
        switch self {
        case .Kpop: return "K-pop"
        case .함수형프로그래밍: return "함수형 프로그래밍"
        case .UX설계: return "UX 설계"
        case .UI디자인: return "UI 디자인"
        default: return self.rawValue
        }
    }
    
    
}
