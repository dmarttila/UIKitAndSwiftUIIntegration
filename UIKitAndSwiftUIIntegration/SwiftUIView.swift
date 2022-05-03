//
//  SwiftUIView.swift
//  UIKitAndSwiftUIIntegrationExamples
//
//  Created by Douglas Marttila on 5/3/22.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var model: ViewModel
    
    init (model: ViewModel) {
        self.model = model
    }
    @State private var value = 0
    let step = 5
    let range = 1...50
    @State private var stringValue = "This is a test"
    
    var body: some View {
        VStack {
            Text("I'm a SwiftUI Component!")
                .font(.title)
            Text("string: \(model.myString)")
            Text("int: \(model.myInteger)")
            
            TextField("Enter some text", text: $stringValue)
            Stepper(value: $value,
                    in: range,
                    step: step) {
                Text("Current: \(value) in \(range.description) " +
                     "stepping by \(step)")
            }
                    .padding(10)
            Button("click to change model") {
                model.myInteger = value
                model.myString = stringValue
            }
        }
    }
}



