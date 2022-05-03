//
//  SwiftUIView.swift
//  UIKitAndSwiftUIIntegrationExamples
//
//  Created by Doug Marttila on 5/3/22.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        VStack {
            Text("I'm a SwiftUI Component!")
                .font(.title)
            Text("string: \(model.myString)")
            Text("int: \(model.myFloat)")
            TextField("", text: $model.myString)
            Slider(value: $model.myFloat, in: 0...100, step: 1)
        }
    }
}



