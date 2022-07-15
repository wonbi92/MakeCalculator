//
//  ViewController.swift
//  Calculator2
//
//  Created by Wonbi on 2022/07/15.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknwon
}

class ViewController: UIViewController {
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber: String = ""
    var firstOperend: Int = 0
    var secondOperend: Int = 0
    var result: String = ""
    var currentOperation: Operation = .unknwon
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func formattingToDecimal(num: String) {
        numberFormatter.numberStyle = .decimal
        numberOutputLabel.text = numberFormatter.string(for: Int(displayNumber) ?? 0)
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        if numberOutputLabel.text == "0" && sender.currentTitle == "0" { return }
        guard let numberValue = sender.currentTitle else { return }
        if displayNumber.count < 9 {
            displayNumber += numberValue
            numberOutputLabel.text = displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        displayNumber = ""
        firstOperend = 0
        secondOperend = 0
        result = ""
        currentOperation = .unknwon
        numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if displayNumber.count < 8, !displayNumber.contains(".") {
            displayNumber += displayNumber.isEmpty ? "0." : "."
            numberOutputLabel.text = displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
    }
}

