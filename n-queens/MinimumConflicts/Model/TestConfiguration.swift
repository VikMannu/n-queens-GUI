//
//  TestConfiguration.swift
//  n-queens
//
//  Created by Victor Ayala on 2023-09-17.
//

import Foundation

struct TestConfiguration {
    let nQueens: Int
    let growthInterval: Int
    let numberOfIterations: Int
    let maxAttempts: Int
    let maxTime: TimeInterval
    
    init(nQueens: String, growthInterval: String, numberOfIterations: String, maxAttempts: String, maxTime: String) {
        self.nQueens = Int(nQueens) ?? 8
        self.growthInterval = Int(growthInterval) ?? 8
        self.numberOfIterations = Int(numberOfIterations) ?? 10
        self.maxAttempts = Int(maxAttempts) ?? 10000
        self.maxTime = TimeInterval(maxTime) ?? 100000.0
    }
}
