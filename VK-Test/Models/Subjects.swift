//
//  Subjects.swift
//  VK-Test
//
//  Created by Сергей Зайцев on 10.05.2023.
//

import Foundation

struct Subjects {
    var id: Int = 0
    private var isInfected: Bool = false
    
    init(id: Int = 0, isInfected: Bool = false) {
        self.id = id
        self.isInfected = isInfected
    }
    
    mutating func tryInfect() -> Bool {
        if !isInfected {
            isInfected = true
            return true
        }
        return false
    }
    
    func checkInfection() -> Bool {
        return isInfected
    }
}
