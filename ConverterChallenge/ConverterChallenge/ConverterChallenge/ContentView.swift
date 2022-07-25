//
//  ContentView.swift
//  ConverterChallenge
//
//  Created by Nedra Mevoli on 7/22/22.
//

import SwiftUI

struct ContentView: View {
    @State private var convertingFrom = UnitLength.centimeters
    @State private var convertingTo = UnitLength.feet
    @State private var inputNumber = 0.0
    @FocusState private var inputIsFocused: Bool

// UnitLength is a built-in API courtesy of Apple that handles the mathmathtics of measurements
    let units: [UnitLength] = [.centimeters, .feet, .inches, .meters, .millimeters]

// MeasurementFormatter is a built-in API courtesy of Apple that formats the values of Units, which adapts to whatever regionally is expected of the user
    let formatter: MeasurementFormatter
        
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    var result: String {
        let inputLength = Measurement(value: inputNumber, unit: convertingFrom)
        let outputLength = inputLength.converted(to: convertingTo)
        return formatter.string(from: outputLength)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Convert")
                }
                    
                Picker("Convert from", selection: $convertingFrom) {
                    ForEach(units, id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Picker("Convert to", selection: $convertingTo) {
                    ForEach(units, id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Converter Challenge")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
