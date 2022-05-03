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
        ZStack {
            Color.lightYellowGreen
                .ignoresSafeArea()
            VStack {
                Text("SwiftUI 😂")
                    .font(.title)
                TextField("", text: $model.myString)
                Slider(value: $model.myFloat, in: 0...100, step: 1)
                Text("int: \(model.myFloat)")
            }
        }
    }
}

extension Color {
    static let lightYellowGreen = Color("lightYellowGreen")
}



