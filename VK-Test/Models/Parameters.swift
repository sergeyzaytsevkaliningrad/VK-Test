//
//  Parameters.swift
//  VK-Test
//
//  Created by Сергей Зайцев on 10.05.2023.
//

import Foundation

struct Parameters {
    var groupSize: Int = 0
    var infectionFactor: Int = 0
    var t: Int = 1
    
    var tInterval: TimeInterval {
        get {
            return TimeInterval(t)
        }
    }
    
    init(groupSize: Int, infectionFactor: Int, t: Int) {
        self.groupSize = groupSize
        self.infectionFactor = infectionFactor
        self.t = t
    }
    
}
