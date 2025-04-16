//
//  MockData.swift
//  Mentoro
//
//  Created by MacBookAir on 4/16/25.
//

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

enum Part: String, CaseIterable {
    case 개발
    case 디자인
    case 비즈니스
}


enum Category {
    case 개발(Development)
    case 디자인(Design)
    case 비즈니스(Business)
    case 소프트스킬(SoftSkills)
    case 게임(Games)
    case 스포츠(Sports)
    case 음식(Food)
    case 음악(Music)
    case 콘텐츠(Contents)
    
    enum Development: String, CaseIterable {
        case 자료구조
        case 알고리즘
        case 추상화
        case 객체지향
        case 아키텍처
    }
    
    enum Design: String, CaseIterable {
        case UX설계
        case 디자인시스템
        case UI디자인
        case 타이포그래피
        case HIG
    }
    enum Business: String, CaseIterable {
        case PM
        case 서비스기획
        case 비즈니스전략
        case 스토리텔링
        case 마케팅
    }
    enum SoftSkills: String, CaseIterable {
        case 마음관리
        case 오너쉽
        case 메타인지
        case 습관형성
        case 평생학습
    }
    enum Games: String, CaseIterable {
        case LOL
        case TFT
        case WOW
        case 구스구스덕
        case 오버워치
    }
    enum Sports: String, CaseIterable {
        case 축구
        case 풋살
        case 농구
        case 수영
        case 배구
    }
    enum Food: String, CaseIterable {
        case 치킨
        case 피자
        case 떡볶이
        case 마라탕
        case 햄버거
    }
    enum Music: String, CaseIterable {
        case 팝
        case 락
        case 발라드
        case 힙합
        case 클래식
    }
    enum Contents: String, CaseIterable {
        case 육아
        case 연애
        case 결혼
        case 자기계발
        case 건강
    }
}
