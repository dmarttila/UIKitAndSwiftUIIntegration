//
//  SwiftUIView.swift
//  UIKitAndSwiftUIIntegrationExamples
//
//  Created by Doug Marttila on 5/3/22.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var model: ViewModel
    
    @State var myString = ""
    
    func updateModel () {
        
    }
    
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
//                TextField("", text: $myString)
//                    .onChange(of: myString) {
//                        print("it changed")
//                    }
                
                TextField("Your Location", text: $myString)
                            .onChange(of: myString) {
                                print($0)
                                model.updatePrivateString($0)// You can do anything due to the change here.
                                // self.autocomplete($0) // like this
                            }
            }
        }
    }
}

extension Color {
    static let lightYellowGreen = Color("lightYellowGreen")
}



