//
//  ViewController.swift
//  UIKitAndSwiftUIIntegration
//
//  Created by Douglas Marttila on 5/3/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var myIntSlider: UISlider!
    @IBOutlet weak var myIntLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!

    @IBOutlet weak var myStringTextField: UITextField!
    

    
    let model = ViewModel(myInteger: 4, myString: "May the 4th be with you")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model)
//        updateIntDisplay()
//        updateStringDisplay()
        updateFromModel()
//        presentSwiftUIView()
        addSwiftUIView()
    }
    

    
    func addSwiftUIView() {
        let swiftUIView = SwiftUIView(model: model)
        let hostingController = UIHostingController(rootView: swiftUIView)

        
        hostingController.view.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
        
        /// Add as a child of the current view controller.
        addChild(hostingController)

        /// Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(hostingController.view)

//        /// Setup the constraints to update the SwiftUI view boundaries.
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        let constraints = [
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
//            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
//            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//
//        /// Notify the hosting controller that it has been moved to the current view controller.
//        hostingController.didMove(toParent: self)
    }
    
    
    func updateFromModel () {
        myStringTextField.text = model.myString
        myIntLabel.text = String(model.myInteger)
    }
    
    func updateToModel () {
        let str = myStringTextField.text ?? ""
        let int = Int(myIntSlider.value)
        model.myString = str
        model.myInteger = int
    }
    

    
    @IBAction func sliderChange(_ sender: Any) {
        updateToModel()
        updateFromModel()
    }
    
    @IBAction func myButtonTap(_ sender: Any) {
        let str = myStringTextField.text ?? ""
        let int = Int(myIntSlider.value)
        model.myString = str
        model.myInteger = int
        print(model)
////        presentSwiftUIView()
//        addSwiftUIView()
    }
}
    


