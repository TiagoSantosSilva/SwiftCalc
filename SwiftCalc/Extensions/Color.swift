//
//  Color.swift
//  SwiftCalc
//
//  Created by Tiago Silva on 05/10/2022.
//

import SwiftUI

extension Color {
    // Return a random color
    static var random: Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
