//
//  ExecutionMinimimConflictsLog.swift
//  n-queens
//
//  Created by Victor Ayala on 2023-09-17.
//

import Foundation

struct ExecutionMinimimConflictsLog: Identifiable {
    let id: String
    let startTime: Date
    var startTimeFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: startTime)
    }
    let endTime: Date
    var endTimeFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: endTime)
    }
    let duration: String
    let expandedNodes: String
    
    init(nQueens: Int, startTime: Date, endTime: Date, expandedNodes: Int) {
        self.id = String(describing: nQueens)
        self.startTime = startTime
        self.endTime = endTime
        self.duration = String(describing: endTime.timeIntervalSince(startTime))
        self.expandedNodes = String(describing: expandedNodes)
    }
}
