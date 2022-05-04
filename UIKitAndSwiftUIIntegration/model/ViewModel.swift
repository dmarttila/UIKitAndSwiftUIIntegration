//
//  ViewModel.swift
//  UIKitAndSwiftUIIntegrationExamples
//
//  Created by Doug Marttila on 5/2/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var myFloat: Float
    @Published var myString: String
    
    init (myFloat: Float, myString: String) {
        self.myFloat = myFloat
        self.myString = myString
    }
    
}
