//
//  MentorModel.swift
//  Mentoro
//
//  Created by MacBookAir on 4/17/25.
//

class Mentor {
    let id: Int
    let name: Name
    let part: Part
    let imageName: String
    
    init(id: Int, name: Name, part: Part) {
        self.id = id
        self.name = name
        self.part = part
        self.imageName = "\(name)"
    }
}
