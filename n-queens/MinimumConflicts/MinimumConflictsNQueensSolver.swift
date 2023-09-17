//
//  MinimumConflictsNQueensSolver.swift
//  n-queens
//
//  Created by Victor Ayala on 2023-09-17.
//

import Foundation
import Combine


class MinimumConflictsNQueensSolver: ObservableObject {
    @Published var data: [ExecutionMinimimConflictsLog] = []
    private let configuration: TestConfiguration
    private var nQueens: Int
    private var board: [Int]
    private var expandedNodes: Int = 0
    
    init(configuration: TestConfiguration) {
        self.configuration = configuration
        self.nQueens = configuration.nQueens
        self.board = Array(0..<configuration.nQueens)
        
        DispatchQueue.global().async {
            self.test()
        }
    }
    
    func calculateConflictsReparations() -> (Int, Int)? {
        var conflictsReparations: [(Int, Int)] = []
        for row in 0..<nQueens {
            if !isValidQueen(row: row, col: board[row], board: self.board) {
                for col in 0..<nQueens {
                    var boardCopy = Array(self.board)
                    boardCopy[row] = col
                    if col != board[row] && isValidQueen(row: row, col: col, board: boardCopy) {
                        conflictsReparations.append((row, col))
                    }
                }
            }
        }
        
        if conflictsReparations.isEmpty {
            return nil
        }
        
        let counter = Dictionary(grouping: conflictsReparations, by: { $0.0 })
        let queenWithLessConflict = counter.min(by: { $0.1.count < $1.1.count })!.key
        conflictsReparations = conflictsReparations.filter { $0.0 == queenWithLessConflict }
        return conflictsReparations.randomElement()
    }
    
    func isValidQueen(row: Int, col: Int, board: [Int]) -> Bool {
        for i in 0..<row {
            // Verificar si hay una reina en la misma columna
            if board[i] == col {
                return false
            }

            // Verificar si hay una reina en la misma diagonal
            if abs(board[i] - col) == row - i {
                return false
            }
        }

        return true
    }
    
    func isValidBoard() -> Bool {
        for row in 0..<nQueens {
            if !isValidQueen(row: row, col: self.board[row], board: self.board) {
                return false
            }
        }
        return true
    }
    
    func randomBoard() {
        board.shuffle()
    }
    
    func solve() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        board = Array(0..<nQueens)
        while !isValidBoard() {
            randomBoard()
            print("\nTablero Generado Aleatoriamente: \(dateFormatter.string(from: Date()))")
            printBoard()
            var attempts = 0
            let startTime = Date.timeIntervalSinceReferenceDate
            while attempts < configuration.maxNodeExpansionAttempts || Date.timeIntervalSinceReferenceDate - startTime <= configuration.maxNodeExpansionTime {
                expandedNodes += 1
                if let conflictsReparations = calculateConflictsReparations() {
                    let (row, col) = conflictsReparations
                    board[row] = col
                } else {
                    if !isValidBoard() {
                        randomBoard()
                        print("Tablero Generado Aleatoriamente (No hay solución): \(dateFormatter.string(from: Date()))")
                        printBoard()
                    }
                }
                
                if isValidBoard() {
                    return
                }
                attempts += 1
            }
        }
    }
    
    func test() {
        for _ in 0..<configuration.numberOfIterations {
            expandedNodes = 0
            let startTime = Date()
            solve()
            print("Tablero Solución")
            printBoard()
            let endTime = Date()
            let log = ExecutionMinimimConflictsLog(nQueens: nQueens, startTime: startTime, endTime: endTime, expandedNodes: expandedNodes)
            DispatchQueue.main.async {
                // Actualizaciones de la interfaz de usuario
                self.data.append(log)
            }
            
            nQueens += configuration.growthInterval
        }
    }
    
    func printBoard() {
        for row in 0..<nQueens {
            let rowString = (0..<nQueens).map { col in
                return board[row] == col ? "Q" : "."
            }.joined(separator: " ")
            print(rowString)
        }
    }
}
