//
//  ViewController.swift
//  UIKitAndSwiftUIIntegration
//
//  Created by Douglas Marttila on 5/3/22.
//

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var myFloatSlider: UISlider!
    @IBOutlet weak var myFloatLabel: UILabel!
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    let model = ViewModel(myInteger: 4, myString: "May the 4th be with you")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiftUIView()
        setupBindings()
    }
    
    //TODO: get the text editing to update as it's edited
    @IBAction func updateText(_ sender: Any) {
        model.myString = myTextField.text ?? ""
        print("ONG")
    }
    
    func addSwiftUIView() {
        let swiftUIView = SwiftUIView(model: model)
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
        addChild(hostingController)
        view.addSubview(hostingController.view)
    }
    
//    func updateFromModel () {
//        myStringTextField.text = model.myString
//        myFloatLabel.text = String(model.myFloat)
//        myFloatSlider.value = model.myFloat
//    }
    
//    func updateToModel () {
//        model.myString = myStringTextField.text ?? ""
//        model.myFloat = myFloatSlider.value
//    }
    
    @IBAction func sliderChange(_ sender: Any) {
//        updateToModel()
        model.myFloat = myFloatSlider.value
//        updateFromModel()
    }
    
    private var switchSubscriber: AnyCancellable?
    
    private func floatChangedInModel (_ value: Float) {
        //updateFromModel won't work!!!!
        myFloatLabel.text = String(value)
        myFloatSlider.value = value
    }
    
    
    private func setupBindings() {
        model.$myFloat
            .sink { [weak self] flt in
                guard let self = self else { return }
                self.floatChangedInModel(flt)
                
            }
            .store(in: &model.listeners)
        
        switchSubscriber = model.$myString.sink{
//            print("Combine yo: \($0)")
//            updateFromModel()
            self.myTextField.text = $0
//            print($0)
        }
    }
        
        //https://theswiftdev.com/the-ultimate-combine-framework-tutorial-in-swift/
        /*
         @IBOutlet weak var textLabel: UILabel!
            @IBOutlet weak var actionButton: UIButton!

            @Published var labelValue: String? = "Click the button!"

            var cancellable: AnyCancellable?

            override func viewDidLoad() {
                super.viewDidLoad()

                self.cancellable = self.$labelValue.receive(on: DispatchQueue.main)
                                                   .assign(to: \.text, on: self.textLabel)

            }

            @IBAction func actionButtonTouched(_ sender: UIButton) {
                self.labelValue = "Hello World!"
            }
         */
        
        //switchSubscriber = model.$myString.sink(receiveValue: <#T##((String) -> Void)##((String) -> Void)##(String) -> Void#>)
//                     .receive(on: DispatchQueue.main)
//                     .assign(to: \.isEnabled, on: submitButton)
//                     .assign(to: myIntLabel.text, on: self)
//                     .assign(to: \.text, on: myIntLabel)
        
        
//        let cancellable = publisher.sink(
//            receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print(error)
//                case .finished:
//                    print("Success")
//                }
//            },
//            receiveValue: { value in
//                print(value)
//            }
//        )
//    }

//    @objc func close() {
//        navigationController?.dismiss(animated: true, completion: nil)
//    }

    


}
    


