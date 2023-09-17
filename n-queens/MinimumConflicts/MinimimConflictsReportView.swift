//
//  MinimimConflictsReportView.swift
//  n-queens
//
//  Created by Victor Ayala on 2023-09-17.
//

import SwiftUI

struct MinimimConflictsReportView: View {
    @StateObject private var viewModel: MinimumConflictsNQueensSolver
    
    init(configuration: TestConfiguration) {
        self._viewModel = StateObject(wrappedValue: MinimumConflictsNQueensSolver(configuration: configuration))
    }
    
    var body: some View {
        List {
            HStack {
                Text("N-Reinas")
                Spacer()
                Text("Duración (s)")
                Spacer()
                Text("Nodos")
            }
            ForEach(viewModel.data, id: \.id) { data in
                HStack {
                    Text(data.id)
                    Spacer()
                    Text(data.duration)
                    Spacer()
                    Text(data.expandedNodes)
                }
            }
        }
        .navigationTitle("Reporte")
    }
}

struct MinimimConflictsReportView_Previews: PreviewProvider {
    static var previews: some View {
        MinimimConflictsReportView(configuration: TestConfiguration(
            nQueens: "8",
            growthInterval: "2",
            numberOfIterations: "10000",
            maxAttempts: "",
            maxTime: "")
        )
    }
}
