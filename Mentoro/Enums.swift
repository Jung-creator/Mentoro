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


enum Category: String, CaseIterable {
    case development
    case design
    case business
    case softSkills
    case games
    case sports
    case food
    case music
    case contents
}


let developmentItems: [String] = ["자료구조","알고리즘","추상화","객체지향","함수형 프로그래밍","아키텍처","디자인패턴","SW엔지니어링","코드가독성","클린코드","유지보수","테스트","코드리팩토링","테스트자동화","CI/CD","성능최적화"]

let designItems: [String] = ["UX설계","디자인시스템","프로토타이핑","UI디자인","컬러시스템","타이포그래피","아이콘디자인","HIG"]
