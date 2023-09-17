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
    let maxNodeExpansionAttempts: Int
    let maxNodeExpansionTime: TimeInterval
    
    init(nQueens: String, growthInterval: String, numberOfIterations: String, maxAttempts: String, maxTime: String) {
        self.nQueens = Int(nQueens) ?? 8
        self.growthInterval = Int(growthInterval) ?? 8
        self.numberOfIterations = Int(numberOfIterations) ?? 10
        self.maxNodeExpansionAttempts = Int(maxAttempts) ?? 2000
        self.maxNodeExpansionTime = TimeInterval(maxTime) ?? 50
    }
}
