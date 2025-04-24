//
//  MentorModel.swift
//  Mentoro
//
//  Created by MacBookAir on 4/20/25.
//

import Foundation


struct Mentor: Identifiable {
    let id = UUID()
    let name: MentorName
    let imageName: String
    let field: Field
    let interests: [SubCategory]
}
