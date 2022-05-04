//
//  ViewModel.swift
//  UIKitAndSwiftUIIntegrationExamples
//
//  Created by Doug Marttila on 5/2/22.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var myFloat: Float
    @Published var myString: String
    @Published private(set) var privateSetString : String
    
    var subscribers: Set<AnyCancellable> = []
    
    init (myInteger: Float, myString: String) {
        self.myFloat = myInteger
        self.myString = myString
        privateSetString = myString
    }
    func updatePrivateString (_ str: String) {
        privateSetString = str
    }
}

extension ViewModel: CustomStringConvertible {
    var description: String {
        var str = "myInteger: \(myFloat)\n"
        str += "myString: \(myString)\n"
        str += "privateSetString: \(privateSetString)"
        return str
    }
}
