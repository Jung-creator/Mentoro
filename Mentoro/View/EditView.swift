//
//  EditView.swift
//  Mentoro
//
//  Created by MacBookAir on 4/18/25.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader {
            geometry in
            let width = geometry.size.width
            ScrollView {
                VStack {
                    Spacer()
                    .frame(height: 32)
                    HStack {
                        Spacer()
                            .frame(width:24)
                        Text("Name")
                            .font(.headline)
                        Button(action: {
                            print("Choose name")
                        }) {
                            Image(systemName: "chevron.up.chevron.down")
                            
                        }
                    }
                    Circle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .frame(width: 144)
                        .padding(.bottom)
                    
                    Group {
                        Color.gray
                            .frame(height:1)
                            .padding(.horizontal, width * 0.1)
                            .opacity(0.2)
                        
                        HStack {
                            ImageAndSelectView()
                            
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .frame(width: 1, height: 32)
                            ImageAndSelectView()
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .frame(width: 1, height: 32)
                            ImageAndSelectView()
                        }
                        Color.gray
                            .frame(height:1)
                            .opacity(0.2)
                            .padding(.horizontal, width * 0.1)
                            .padding(.top,4)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        print("Save tapped")
                        dismiss()
                    }
                }
                
            }
        }
        
        
    }
}

struct ImageAndSelectView: View {
    @State private var showPicker = false
    @State private var selectedItem = "10"
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0)
            VStack {
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .padding(.top,8)
                
                Button(action: {
                    showPicker = true
                    print("Button Tapped, showPicker: \(showPicker)")
                }) {
                    Picker("Select Choice", selection: $selectedItem) {
                        ForEach(["10", "2000", "3000", "4000"], id: \.self) { item in
                            Text(item)
                                .font(.caption)
                            
                        }
                    }
                }
            }
            .padding(.horizontal,8)
        }
        .frame(width: 80)
    }
}

//var options = ["옵션1", "옵션2", "옵션3", "옵션4"]
//@State private var selectionOption = 0
//
//Picker("Select Choice", selection: $selectionOption) {
//  ForEach(0 ..< options.count) {
//    Text(options[$0])
//  }
//}

#Preview {
    EditView()
}
