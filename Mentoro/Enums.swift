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
    case 자료구조, 알고리즘, 추상화, 객체지향, 아키텍처, 코드가독성, 클린코드, 유지보수, 테스트코드, 테스트자동화, 리팩토링, CICD, 성능최적화, 지속가능개발, IOS, VisionOS, Android, CrossPlatform, Web, UnityUnreal, 게임개발, OS이해, 프론트엔드, 백엔드, 데이터엔지니어링, 빅데이터, 데이터시각화, AI, ML, MLOps, API, 인프라

    // 디자인
    case UX설계, 디자인시스템, 프로토타이핑, UI디자인, 컬러시스템, 타이포그래피, 아이콘디자인, HIG, 게임내러티브디자인, Adobe, Figma, Sketch, Blender, 입체모델링, 모션그래픽, 디자인리서치, 디자인방법론, 레퍼런스수집

    // 비즈니스
    case PM, 서비스기획, RandD, 비즈니스전략, MVP전략, 밸류에이션, 포지셔닝, 벤치마킹, 브랜딩, 스토리텔링, 마케팅, 창업, 스타트업운영, 사업자등록, 세무관리, 법인설립, 투자유치, 프리랜서운영, 세금관리, 포트폴리오제작, 팀운영, 업무자동화, 앱수익화전략, 써드파티관리

    // 소프트스킬
    case 마음관리, 오너쉽, 메타인지, 습관형성, 평생학습, 디지털노마드, 학습과학, 시간관리, 문제정의, 인사이트도출, 분석적추론, 사고방식프레임워크, 비판적사고, 논리적사고, 의사결정, 창의성, 팀워크, 팀커뮤니케이션, 클라이언트커뮤니케이션, 스피치, 프레젠테이션, 성장마인드셋, 긍정성, 수용성, 자기동기부여, 겸손과존중

    // 게임
    case LOL, TFT, WOW, FC24, 오버워치, 구스구스덕, 어몽어스, 배틀그라운드, 스위치, 플레이스테이션, 스팀게임, 인디게임, 보드게임, 방탈출, 레이저서바이벌, 마피아게임, 몬스트헌터, 발로란트, 포트나이트, 스타듀벨리, 젤다의전설, 우마무스메, 로블룩스, 마인크래프트

    // 스포츠
    case 축구, 풋살, 야구, 농구, 배구, 탁구, 러닝, 등산, 수영, 헬스, 크로스핏, 요가, 필라테스, 발레, 자전거, 클라이밍, 배드민턴, 테니스, 스쿼시, 골프, 프리다이빙, 스쿠버다이빙, 요트세일링, 서핑, 윈드서핑, 패들보드, 스케이트보드, F1, 모터스포츠, UFC, 격투기

    // 음식
    case 치킨, 피자, 떡볶이, 마라탕, 햄버거, 라면, 돈까스, 회, 초밥, 만두, 국밥, 국수, 빵, 과자, 아이스크림, 떡, 디저트, 커피, 차, 맥주, 소주, 와인, 위스키, 보드카, 고량주, 맛집탐방, 요리, 자취요리, 미식회, 맛난음식나누기, 레시피연구, 푸드페이, 푸드테크, 편의점, 노포맛집, 채식비건, 키토음식, 저탄고지

    // 음악
    case 팝, 락, Kpop, 여돌, 남돌, 힙합, RandB, EDM, 클래식, 재즈, 어쿠스틱, 인디음악, 발라드, 트로트, 국악, 피아노, 보컬, 기타, 드럼, 베이스, 바이올린, 우쿠렐레, 색소폰

    // 콘텐츠
    case 육아, 연애, 결혼, 자기계발, 건강, 다이어트, 강아지, 고양이, 자연, 하늘구름, 캠핑, 교육, 책, 강의, 영화, 드라마, 예능, 웹툰, 먹방, 브이로그, 일기, 드로잉, 숏폼, 사진, 출사, 필름카메라, 유튜브, 인스타그램, 페이스북, 링크드인, 트위터

    var category: Category {
        switch self {
        case .자료구조, .알고리즘, .추상화, .객체지향, .아키텍처, .코드가독성, .클린코드, .유지보수, .테스트코드, .테스트자동화, .리팩토링, .CICD, .성능최적화, .지속가능개발, .IOS, .VisionOS, .Android, .CrossPlatform, .Web, .UnityUnreal, .게임개발, .OS이해, .프론트엔드, .백엔드, .데이터엔지니어링, .빅데이터, .데이터시각화, .AI, .ML, .MLOps, .API, .인프라:
            return .개발

        case .UX설계, .디자인시스템, .프로토타이핑, .UI디자인, .컬러시스템, .타이포그래피, .아이콘디자인, .HIG, .게임내러티브디자인, .Adobe, .Figma, .Sketch, .Blender, .입체모델링, .모션그래픽, .디자인리서치, .디자인방법론, .레퍼런스수집:
            return .디자인

        case .PM, .서비스기획, .RandD, .비즈니스전략, .MVP전략, .밸류에이션, .포지셔닝, .벤치마킹, .브랜딩, .스토리텔링, .마케팅, .창업, .스타트업운영, .사업자등록, .세무관리, .법인설립, .투자유치, .프리랜서운영, .세금관리, .포트폴리오제작, .팀운영, .업무자동화, .앱수익화전략, .써드파티관리:
            return .비즈니스

        case .마음관리, .오너쉽, .메타인지, .습관형성, .평생학습, .디지털노마드, .학습과학, .시간관리, .문제정의, .인사이트도출, .분석적추론, .사고방식프레임워크, .비판적사고, .논리적사고, .의사결정, .창의성, .팀워크, .팀커뮤니케이션, .클라이언트커뮤니케이션, .스피치, .프레젠테이션, .성장마인드셋, .긍정성, .수용성, .자기동기부여, .겸손과존중:
            return .소프트스킬

        case .LOL, .TFT, .WOW, .FC24, .오버워치, .구스구스덕, .어몽어스, .배틀그라운드, .스위치, .플레이스테이션, .스팀게임, .인디게임, .보드게임, .방탈출, .레이저서바이벌, .마피아게임, .몬스트헌터, .발로란트, .포트나이트, .스타듀벨리, .젤다의전설, .우마무스메, .로블룩스, .마인크래프트:
            return .게임

        case .축구, .풋살, .야구, .농구, .배구, .탁구, .러닝, .등산, .수영, .헬스, .크로스핏, .요가, .필라테스, .발레, .자전거, .클라이밍, .배드민턴, .테니스, .스쿼시, .골프, .프리다이빙, .스쿠버다이빙, .요트세일링, .서핑, .윈드서핑, .패들보드, .스케이트보드, .F1, .모터스포츠, .UFC, .격투기:
            return .스포츠

        case .치킨, .피자, .떡볶이, .마라탕, .햄버거, .라면, .돈까스, .회, .초밥, .만두, .국밥, .국수, .빵, .과자, .아이스크림, .떡, .디저트, .커피, .차, .맥주, .소주, .와인, .위스키, .보드카, .고량주, .맛집탐방, .요리, .자취요리, .미식회, .맛난음식나누기, .레시피연구, .푸드페이, .푸드테크, .편의점, .노포맛집, .채식비건, .키토음식, .저탄고지:
            return .음식

        case .팝, .락, .Kpop, .여돌, .남돌, .힙합, .RandB, .EDM, .클래식, .재즈, .어쿠스틱, .인디음악, .발라드, .트로트, .국악, .피아노, .보컬, .기타, .드럼, .베이스, .바이올린, .우쿠렐레, .색소폰:
            return .음악

        case .육아, .연애, .결혼, .자기계발, .건강, .다이어트, .강아지, .고양이, .자연, .하늘구름, .캠핑, .교육, .책, .강의, .영화, .드라마, .예능, .웹툰, .먹방, .브이로그, .일기, .드로잉, .숏폼, .사진, .출사, .필름카메라, .유튜브, .인스타그램, .페이스북, .링크드인, .트위터:
            return .콘텐츠
        }
    }
    
    var displayName: String {
        switch self {
        case .CICD: return "CICD"
        case .UnityUnreal: return "Unity/Unreal"
        case .CrossPlatform: return "Cross-Platform"
        case .Kpop: return "K-pop"
        case .UX설계: return "UX 설계"
        case .UI디자인: return "UI 디자인"
        case .입체모델링: return "3D 모델링"
        case .RandD: return "R&D"
        case .RandB: return "R&B"
        default: return self.rawValue
        }
    }
    
    
}
