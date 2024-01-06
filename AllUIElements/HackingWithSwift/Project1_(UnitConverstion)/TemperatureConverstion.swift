//
//  TemperatureConverstion.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 06/01/24.
//

import SwiftUI

public enum Units : String,CaseIterable{
    case Fahrenheit, Celsius, Kelvin
}


struct TemperatureConverstion: View {
    @State private var inputTemp = "0"
    @State private var inputUnit : String = Units.Fahrenheit.rawValue
    @State private var outputUnit : String = Units.Fahrenheit.rawValue
    var body: some View {
        NavigationStack{
            Form{
                Section("Temp Convert From") {
                    TextField("Enter Here", text: $inputTemp)
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(Units.allCases, id: \.rawValue) { item in
                                  Text(item.rawValue)
                              }
                    }.pickerStyle(.segmented)
                }
                
                Section("Temp Value after converstion") {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(Units.allCases, id: \.rawValue) { items in
                            Text(items.rawValue)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text("Result : \(unitConvertion(input: Double(inputTemp) ?? 0, inputUnit: Units(rawValue: inputUnit) ?? .Fahrenheit, outputUnit: Units(rawValue: outputUnit) ?? .Fahrenheit))")
                }
            }
            .navigationTitle("Temp Conversion")
        }
    }
    
    func unitConvertion(input : Double , inputUnit : Units,outputUnit : Units) -> (Double){
        var outputConvertaionUnit : Double = 0.0
        switch(inputUnit,outputUnit){
        case (Units.Fahrenheit,Units.Fahrenheit):
            let inputunit = Measurement(value: input, unit: UnitTemperature.fahrenheit)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.fahrenheit).value
        case (.Fahrenheit, .Celsius):
            let inputunit = Measurement(value: input, unit: UnitTemperature.fahrenheit)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.celsius).value
        case (.Fahrenheit, .Kelvin):
            let inputunit = Measurement(value: input, unit: UnitTemperature.fahrenheit)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.kelvin).value
        case (.Celsius, .Fahrenheit):
            let inputunit = Measurement(value: input, unit: UnitTemperature.celsius)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.fahrenheit).value
        case (.Celsius, .Kelvin):
            let inputunit = Measurement(value: input, unit: UnitTemperature.celsius)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.kelvin).value
        case (.Kelvin, .Fahrenheit):
            let inputunit = Measurement(value: input, unit: UnitTemperature.kelvin)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.fahrenheit).value
        case (.Kelvin, .Celsius):
            let inputunit = Measurement(value: input, unit: UnitTemperature.kelvin)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.celsius).value
        case (.Kelvin, .Kelvin):
            let inputunit = Measurement(value: input, unit: UnitTemperature.kelvin)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.kelvin).value
        case (.Celsius, .Celsius):
            let inputunit = Measurement(value: input, unit: UnitTemperature.celsius)
            outputConvertaionUnit = inputunit.converted(to: UnitTemperature.celsius).value
         }
        return outputConvertaionUnit
    }
}

#Preview {
    TemperatureConverstion()
}
