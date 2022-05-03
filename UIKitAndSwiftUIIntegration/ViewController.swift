//
//  ViewController.swift
//  UIKitAndSwiftUIIntegration
//
//  Created by Doug Marttila on 5/3/22.
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
    }
    
    func addSwiftUIView() {
        let swiftUIView = SwiftUIView(model: model)
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
        addChild(hostingController)
        view.addSubview(hostingController.view)
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        model.myFloat = myFloatSlider.value
    }
    //"gotcha --- model: \(model.myFloat) | combine value: \(value)")
    
    private func floatChangedInModel (_ value: Float) {
        myFloatLabel.text = String(value)
        myFloatSlider.value = value
    }
    
    private var stringSubscriber: AnyCancellable?
    private func setupBindings() {
        model.$myFloat
            .sink { [weak self] float in
                guard let self = self else { return }
                self.floatChangedInModel(float)
                
            }
            .store(in: &model.subscribers)
        
        stringSubscriber = model.$myString.sink{
            self.myTextField.text = $0
        }
    }
        //print("gotcha --- model: \(model.myFloat) | combine value: \(value)")
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
    


