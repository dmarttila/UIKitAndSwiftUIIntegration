//
//  ViewModel.swift
//  UIKitAndSwiftUIIntegrationExamples
//
//  Created by Doug Marttila on 5/2/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var myInteger: Int
    @Published var myString: String
    
    @Published private(set) var privateSetInt: Int
    @Published private(set) var privateSetString : String
    
    init (myInteger: Int, myString: String) {
        self.myInteger = myInteger
        self.myString = myString
        privateSetInt = myInteger + 39
        privateSetString = myString + " and also with you"
    }
    
    func updatePrivateInt (int: Int) {
        privateSetInt = int
    }
    func updatePrivateString (str: String) {
        privateSetString = str
    }
}

extension ViewModel: CustomStringConvertible {
    var description: String {
        var str = "myInteger: \(myInteger)\n"
        str += "myString: \(myString)\n"
        str += "privateSetInt: \(privateSetInt)\n"
        str += "privateSetString: \(privateSetString)"
        return str
    }
}
