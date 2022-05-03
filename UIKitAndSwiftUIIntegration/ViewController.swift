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

        updateFromModel()

        addSwiftUIView()
        
        setupBindings()
        
    }
    
    
    private func setupBindings() {
        model.$myInteger
            .sink { [weak self] in
                guard let self = self else { return }
                self.integerChangedInModel($0)
            }
            .store(in: &model.listeners)
    }

    @objc func close() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    

    private func integerChangedInModel (_ value: Int) {
        print("yeah")
        print(value)
    }


    
    func addSwiftUIView() {
        let swiftUIView = SwiftUIView(model: model)
        let hostingController = UIHostingController(rootView: swiftUIView)

        
        hostingController.view.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
        
        /// Add as a child of the current view controller.
        addChild(hostingController)

        /// Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(hostingController.view)


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
    


