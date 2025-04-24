//
//  ChipView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/19/25.
//

import SwiftUI
import SwiftData


struct ChipLayoutView: View {
    let width: CGFloat
    
    @Binding var isFavorite: Bool
    @State private var widths: [CGFloat] = []
//    @Binding var hiddenCount: Int
    var hiddenCount: Binding<Int>?
    
    private let chipLabels: [SubCategory]
    private let mentorName: MentorName
    var favorites: [FavoriteItem]
    
    init(chipLabels: [SubCategory], mentorName: MentorName, isFavorite: Binding<Bool>, favorites: [FavoriteItem], width: CGFloat, hiddenCount: Binding<Int>? = nil) {
        self._isFavorite = isFavorite
        self.chipLabels = chipLabels
        self.mentorName = mentorName
        self.favorites = favorites
        self.width = width
        _widths = State(initialValue: Array(repeating:0, count: chipLabels.count))
        self.hiddenCount = hiddenCount
    }
    
    private func computeRows(from widths: [CGFloat], within maxWidth: CGFloat) -> [[Int]] {
        var currentX: CGFloat = 0
        var rows: [[Int]] = [[]]
        
        for (index, width) in widths.enumerated() {
            let chipWidth = isFavorite ? (width + 16) : width + 32
            if currentX + chipWidth > maxWidth {
                rows.append([index])
                currentX = chipWidth
            } else {
                rows[rows.count - 1].append(index)
                currentX += chipWidth
            }
        }
        return rows
    }
    
    
    var body: some View {
            
            let maxWidth = width - 32
            let rows = computeRows(from: widths, within: maxWidth)
            // favorite 화면이면 2줄만 나옵니다.
            let visibleRows = isFavorite ? Array(rows.prefix(2)) : rows
            let visibleIndices = visibleRows.flatMap { $0 }
            
        
        // favorite 화면이면 leading으로 정렬됩니다
        VStack(alignment: isFavorite ? .leading : .center) {
            ForEach(0..<visibleRows.count, id: \.self) {
                rowIndex in HStack(spacing:0) {
                    ForEach(visibleRows[rowIndex], id: \.self) {
                        i in
                        let chip = chipLabels[i]
                        let isSelected = favorites.contains {
                            $0.mentorName == mentorName && $0.chipLabel == chip
                        }
                        
                        ChipView(textWidth: $widths[i], label: chipLabels[i], mentorName: mentorName, isFavorite: isFavorite, isInitiallySelected: isSelected)
                    }
                }
            }
            .padding(.bottom, -4)
        }
        .onAppear {
            hiddenCount?.wrappedValue = chipLabels.count - visibleIndices.count
        }
//
//        if isFavorite && hiddenCount > 0 {
//            ZStack {
//                Circle()
//                    .fill(Color.white)
//                    .frame(width: 30)
//                Circle()
//                    .fill(Color.blue)
//                    .frame(width: 24)
//                
//                Text("+\(hiddenCount)")
//                    .foregroundStyle(Color.white)
//                    .font(.caption2.bold())
//                    .padding(.bottom, 4)
//            }
//            .padding(.bottom, -4)
//        }
    
            
    }
    
}



struct ChipView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var textWidth: CGFloat
    @State private var isSelected = false
    var label: SubCategory
    var mentorName: MentorName
    var isFavorite: Bool
    var isInitiallySelected: Bool = false
    
    init(textWidth: Binding<CGFloat>, label: SubCategory, mentorName: MentorName, isFavorite: Bool, isInitiallySelected: Bool) {
        
        self._textWidth = textWidth
        self.label = label
        self.mentorName = mentorName
        self.isFavorite = isFavorite
        _isSelected = State(initialValue: isInitiallySelected)
    }
    
    
    
    var body: some View {
        
        if isFavorite {
            chipContent
        } else {
            Button(action: {
                isSelected.toggle()
                
                if isSelected {
                    let item = FavoriteItem(mentorName: mentorName, chipLabel: label)
                    modelContext.insert(item)
                } else {
                    if let allItem = try? modelContext.fetch(FetchDescriptor<FavoriteItem>()) {
                        for item in allItem where item.mentorName == mentorName && item.chipLabel == label {
                            modelContext.delete(item)
                        }
                    }
                }
            })
            {
                chipContent
            }
            .buttonStyle(.plain)
        }
    }
    
    enum chipContentProperties {
        case isFavorite
        case notFavorite
        
        var colorOpacity: Double {
            switch self {
            case .isFavorite:
                return 1
            case .notFavorite:
                return 0.6
            }
        }
    }
    
    private var chipContent: some View {
//        let favorite: chipContentProperties = isFavorite ? .isFavorite : .notFavorite
        VStack {
            HStack {
                Text(label.rawValue)
                if isSelected && !isFavorite {
                    Image(systemName: "heart.fill")
                        .padding(.leading,-8)
                        .foregroundColor(label.category.color.opacity(0.6))
                }
            }
                .foregroundColor(.black)
                .font(isFavorite ? .caption : .footnote)
                .background(
                    GeometryReader {
                        geomtry in Color.clear.onAppear {
                            textWidth = geomtry.size.width
                        }
                    }
                )
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
                .padding(.horizontal, isFavorite ? 8 : 16)
                .padding(.vertical,isFavorite ? 4 : 8)
                .background(label.category.color.opacity(isSelected && !isFavorite ? 0.24 : 0.16))
                .cornerRadius(24)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(isSelected && !isFavorite ? label.category.color.opacity(0.5) : Color.clear, lineWidth: 2)
                )
            
        }
        .padding(.horizontal, 2)
    }
}



//#Preview {
//    ChipLayoutView(chipLabels: [.자료구조, .추상화, .객체지향, .아키텍처, .코드가독성, .유지보수, .리팩토링],mentorName: mockMentors.first!.name, isFavorite: .constant(false), width: 300)
//}
