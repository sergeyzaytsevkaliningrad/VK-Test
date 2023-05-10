//
//  Scale.swift
//  VK-Test
//
//  Created by Сергей Зайцев on 10.05.2023.
//

import SwiftUI

func scaleScreen(_ value : CGFloat) -> CGFloat{
    let x = UIScreen.main.bounds.width/375
    return value * x
}
func scaleScreen_y(_ value : CGFloat) -> CGFloat{
    let y = UIScreen.main.bounds.height/812
    return value * y
}
