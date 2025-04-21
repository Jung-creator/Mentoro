//
//  FavoriteItemModel.swift
//  Mentoro
//
//  Created by MacBookAir on 4/21/25.
//

import SwiftData
import Foundation

@Model
class FavoriteItem {
    var id: UUID = UUID()
    var mentorName: MentorName
    var chipLabel: SubCategory

    init(id: UUID = UUID(), mentorName: MentorName, chipLabel: SubCategory) {
        self.id = id
        self.mentorName = mentorName
        self.chipLabel = chipLabel
    }
}
