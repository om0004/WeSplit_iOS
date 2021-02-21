//
//  ContentView.swift
//  WeSplit
//
//  Created by om on 29/01/21.
//
import SwiftUI
struct ContentView: View
{
    @State private var checkAmount=""
    @State private var numberOfpeople=0
    @State private var tipPercentage=2
    let tipPercentages=[0,5,10,15,20,25]
    var totalPerPerson:Double
    {
        let persons=Double(numberOfpeople+2)
        let tip=Double(tipPercentages[tipPercentage])
        let amount=Double(checkAmount) ?? 0
        let totalTip=(amount*tip)/100
        return (totalTip+amount)/persons
    }
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    TextField("enter amount:",text:$checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("number of people",selection:$numberOfpeople)
                    {
                        ForEach(2..<99)
                        {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header:Text("How much tip do u want to give?"))
                {
                    Picker("Tip Percentage",selection:$tipPercentage)
                    {
                        ForEach(0..<tipPercentages.count)
                        {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section
                {
                    Text("$\(totalPerPerson,specifier:"%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
