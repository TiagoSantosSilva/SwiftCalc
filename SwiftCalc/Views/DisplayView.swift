//
//  DisplayView.swift
//  SwiftCalc
//
//  Created by Tiago Silva on 03/10/2022.
//

import SwiftUI

struct DisplayView: View {
    @Binding var display: String
    
    var body: some View {
        HStack {
            if display.isEmpty {
                Text("0")
                // Add display identifier
                    .padding(.horizontal, 5)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .trailing
                    )
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.gray)
                    )
            } else {
                Text(display)
                    .accessibilityIdentifier("display")
                // Add display identifier
                    .padding(.horizontal, 5)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .trailing
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color.gray)
                    )
            }
        }.background(Color.random)
        
        
        let _ = Self._printChanges()
    }
}


struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(display: .constant("123"))
    }
}
