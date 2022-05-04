//
//  ViewController.swift
//  UIKitAndSwiftUIIntegration
//
//  Created by Doug Marttila on 5/3/22.
//

import UIKit
import SwiftUI
import Combine

/*
 --  remove unused IBOutlet
 Finish preso
 Start with code commented out in Swift UI and main
 figure out more Combine
 Falcon going inside Imperial Cruiser pic
 R2-D2 turning off the garbage compactor - data binding
 Add Star Wars pics to app
 */

class ViewController: UIViewController {
    @IBOutlet weak var myFloatSlider: UISlider!
    @IBOutlet weak var myFloatLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    let model = ViewModel(myFloat: 4, myString: "May the 4th be with you")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiftUIView()
        setupBindings()
    }
    
    func addSwiftUIView() {
        let swiftUIView = SwiftUIView(model: model)
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
        addChild(hostingController)
        view.addSubview(hostingController.view)
    }
    
    //Button action
    @IBAction func updateText(_ sender: Any) {
        model.myString = myTextField.text ?? ""
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        model.myFloat = myFloatSlider.value
    }
    
    private var stringSubscriber: AnyCancellable?
    private var floatSubscriber: AnyCancellable?
    
    private func setupBindings() {
        stringSubscriber = model.$myString.sink {
            self.myTextField.text = $0
        }
        
        floatSubscriber = model.$myFloat
            .sink { [weak self] float in
                guard let self = self else { return }
                self.floatChangedInModel(float)
            }
    }
    
    private func floatChangedInModel (_ value: Float) {
        //use the combine value, not the model
        print("gotcha --- model: \(model.myFloat) | combine value: \(value)")
        myFloatLabel.text = String(value)
        myFloatSlider.value = value
    }
}
    


