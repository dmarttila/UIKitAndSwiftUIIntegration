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
    
    
    var body: some View {
        VStack {
            Text("I'm a SwiftUI Component!")
                .font(.title)
            Text("string: \(model.myString)")
            Text("int: \(model.myInteger)")
        }
    }
}



//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
