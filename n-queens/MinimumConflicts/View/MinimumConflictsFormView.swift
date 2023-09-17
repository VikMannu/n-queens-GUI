//
//  MinimumConflictsFormView.swift
//  n-queens
//
//  Created by Victor Ayala on 2023-09-17.
//

import SwiftUI

struct MinimumConflictsFormView: View {
    @State private var nQueens: String = ""
    @State private var growthInterval: String = ""
    @State private var numberOfIterations: String = ""
    
    @State private var maxAttempts: String = ""
    @State private var maxTime: String = ""
    private var configuration: TestConfiguration {
        return TestConfiguration(
            nQueens: nQueens,
            growthInterval: growthInterval,
            numberOfIterations: numberOfIterations,
            maxAttempts: maxAttempts,
            maxTime: maxTime
        )
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Configuración principal") {
                    TextField("N-reinas inicial", text: $nQueens)
                        .keyboardType(.numberPad)
                    
                    TextField("Intervalo de saltos", text: $growthInterval)
                        .keyboardType(.numberPad)
                    
                    TextField("Número de iteraciones", text: $numberOfIterations)
                        .keyboardType(.numberPad)
                }
                
                Section("Configuración secundaria (Opcional)") {
                    TextField("Número de intentos para un tablero", text: $maxAttempts)
                        .keyboardType(.numberPad)
                    
                    TextField("Intervalo de saltos", text: $maxTime)
                        .keyboardType(.numberPad)
                }
            }
            .navigationBarTitle("Formulario")
            .navigationBarItems(trailing:
                NavigationLink("Inciar Test", destination: { MinimimConflictsReportView(configuration: configuration)  })
            )
            .onTapGesture {
                // Oculta el teclado al tocar en cualquier parte de la pantalla
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct MinimumConflictsFormView_Previews: PreviewProvider {
    static var previews: some View {
        MinimumConflictsFormView()
    }
}
