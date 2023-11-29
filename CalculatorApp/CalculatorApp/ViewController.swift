//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Yogesh Rathore on 29/11/23.
//

import UIKit
import Calculator_FrameWork

class ViewController: UIViewController {

    @IBOutlet weak var TextFieldA: UITextField!
    @IBOutlet weak var TextFieldB: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var calculator: Calculator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calculator = Calculator()
    }

    @IBAction func multiplyButtonDidTap(_ sender: Any) {
        
        let valueA = Int(TextFieldA.text?.removeNonNumericsValue() ?? "0") ?? 0
        let valueB = Int(TextFieldB.text?.removeNonNumericsValue() ?? "0") ?? 0
        
        let result = calculator?.multiplication(valueA, with: valueB)
        
        resultLabel.text = "Result: \(result ?? 0)"
        resignFirstResponder()
    }
    
}

private extension String {
    func removeNonNumericsValue() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
    }
}

