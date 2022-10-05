//
//  MemoryView.swift
//  SwiftCalc
//
//  Created by Tiago Silva on 03/10/2022.
//

import SwiftUI

struct MemoryView: View {
    @Binding var memory: Double
    var geometry: GeometryProxy
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(memory)")
                .accessibilityIdentifier("memoryDisplay")
                .padding(.horizontal, 5)
                .frame(
                    width: geometry.size.width * 0.85,
                    alignment: .trailing
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.gray)
                )
                .gesture(gesture)
            Text("M")
        }.padding(.bottom).padding(.horizontal, 5)
    }
    
    private var gesture: some Gesture {
        #if targetEnvironment(macCatalyst)
        return TapGesture(count: 2)
            .onEnded { _ in
                self.memory = 0.0
            }
        #else
        return DragGesture(minimumDistance: 20)
            .onEnded { _ in
                memory = 0.0
            }
        #endif
    }
}
