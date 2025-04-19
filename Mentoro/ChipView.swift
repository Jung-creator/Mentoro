//
//  ChipView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/19/25.
//

import SwiftUI


struct ChipLayoutView: View {
    let width: CGFloat
    
    @Binding var isFavorite: Bool
    @State private var widths: [CGFloat] = []
    private let chipLabels: [String]
    
    init(chipLabels: [String], isFavorite: Binding<Bool>, width: CGFloat) {
        self._isFavorite = isFavorite
        self.chipLabels = chipLabels
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
                        i in ChipView(textWidth: $widths[i], label: chipLabels[i])
                    }
                }
            }
            .padding(.bottom, -4)
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
    @Binding var textWidth: CGFloat
    var label: String
    var body: some View {
        
        VStack {
            Text(label)
                .font(.caption)
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
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
        }
        .padding(.horizontal, 2)
    }
}

#Preview {
    ChipLayoutView(chipLabels: ["Chip", "Chip 2000", "Chip 3", "Chip 4", "Chip 5", "Chip 6", "Chip 7", "Chip 7", "Chip 7", "Chip 7", "Chip 7", "Chip 7", "Chip 7", "Chip 7", "Chip 7"], isFavorite: .constant(true), width: 300)
}
