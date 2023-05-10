//
//  ColorManager.swift
//  VK-Test
//
//  Created by Сергей Зайцев on 10.05.2023.
//

import SwiftUI

extension Color {
    static let backGroundGradient = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color.blue, location: 0),
            .init(color: Color.white, location: 1)]),
        startPoint: UnitPoint(x: 1.1, y: 3.5),
        endPoint: UnitPoint(x: 0.15, y: 4.0))
    
    static let blackMain = Color.black.opacity(0.8)
}
