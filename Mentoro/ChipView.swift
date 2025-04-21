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
    
    private let chipLabels: [SubCategory]
    private let mentorName: MentorName
    
    init(chipLabels: [SubCategory], mentorName: MentorName, isFavorite: Binding<Bool>, width: CGFloat) {
        self._isFavorite = isFavorite
        self.chipLabels = chipLabels
        self.mentorName = mentorName
        _widths = State(initialValue: Array(repeating:0, count: chipLabels.count))
        self.width = width
        
    }
    
    private func computeRows(from widths: [CGFloat], within maxWidth: CGFloat) -> [[Int]] {
        var currentX: CGFloat = 0
        var rows: [[Int]] = [[]]
        
        for (index, width) in widths.enumerated() {
            let chipWidth = width + 16
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
//             favorite 화면이면 2줄만 나옵니다.
            let visibleRows = isFavorite ? Array(rows.prefix(2)) : rows
            let visibleIndices = visibleRows.flatMap { $0 }
            let hiddenCount = chipLabels.count - visibleIndices.count
        
        // favorite 화면이면 leading으로 정렬됩니다
        VStack(alignment: isFavorite ? .leading : .center) {
            ForEach(0..<visibleRows.count, id: \.self) {
                rowIndex in HStack(spacing:0) {
                    ForEach(visibleRows[rowIndex], id: \.self) {
                        i in ChipView(textWidth: $widths[i], label: chipLabels[i], mentorName: mentorName, isFavorite: isFavorite)
                    }
                }
            }
            .padding(.bottom, isFavorite ? -4 : 0)
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
    
    
    var body: some View {
        
        Button(action: {
            isSelected.toggle()
            let item = FavoriteItem(mentorName: mentorName, chipLabel: label)
            
            // 중복 방지 검사 로직
            let existing = try? modelContext.fetch(FetchDescriptor<FavoriteItem>(predicate: #Predicate { $0.mentorName == mentorName && $0.chipLabel == label }))
            if existing?.isEmpty ?? true {
                modelContext.insert(item)
            }
            
        }) {
            VStack {
                HStack {
                    Text(label.rawValue)
                    if isSelected {
                        Image(systemName: "heart.fill")
                            .padding(.leading,-8)
                            .foregroundColor(label.category.color.opacity(0.6))
                    }
                }
                    .foregroundColor(.black)                 .font(isFavorite ? .caption : .body)
                    .background(
                        GeometryReader {
                            geomtry in Color.clear.onAppear {
                                textWidth = geomtry.size.width
                            }
                        }
                    )
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.horizontal,8)
                    .padding(.vertical,4)
                    .background(label.category.color.opacity(isSelected ? 0.24 : 0.16))
                    .cornerRadius(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isSelected ? label.category.color.opacity(0.5) : Color.clear, lineWidth: 2)
                    )
                
            }
            .padding(.horizontal, isFavorite ? 2 : 4)
            
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ChipLayoutView(chipLabels: [.자료구조, .추상화, .객체지향, .아키텍처, .코드가독성, .유지보수, .리팩토링],mentorName: mockMentors.first!.name, isFavorite: .constant(false), width: 300)
}
