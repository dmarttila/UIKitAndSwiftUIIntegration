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
    @Published private(set) var privateSetString : String
    
    init (myFloat: Float, myString: String) {
        self.myFloat = myFloat
        self.myString = myString
        privateSetString = myString
    }
    
    func updatePrivateString (_ str: String) {
        privateSetString = str
    }
}
