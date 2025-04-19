//
//  ChipView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/19/25.
//

import SwiftUI


struct ChipLayoutView: View {
    
    @State private var widths: [CGFloat] = []
    private let chipLabels: [String]
    
    init(chipLabels: [String]) {
        self.chipLabels = chipLabels
        _widths = State(initialValue: Array(repeating:0, count: chipLabels.count))
        
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
        GeometryReader { geometry in
            let maxWidth = geometry.size.width - 80
            
            let rows = computeRows(from: widths, within: maxWidth)
            
            
            VStack {
                ForEach(0..<rows.count, id: \.self) {
                    rowIndex in HStack(spacing:0) {
                        ForEach(rows[rowIndex], id: \.self) {
                            i in ChipView(textWidth: $widths[i], label: chipLabels[i])
                        }
                    }
                }
            }
        }
    }
}



struct ChipView: View {
    @Binding var textWidth: CGFloat
    var label: String
    
    var body: some View {
        let horizontalPadding: CGFloat = 4 * 2
        let outterPadding: CGFloat = 4 * 2
//        let totalWidth = textWidth + horizontalPadding + outterPadding
        
        VStack {
            Text(label)
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
            
//            Text(String(format: "%.2f", totalWidth))
                
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    ChipLayoutView(chipLabels: ["Chip", "Chip 2000", "Chip 3", "Chip 4", "Chip 5", "Chip 6", "Chip 7", "Chip 7", "Chip 7", "Chip 7"])
}
