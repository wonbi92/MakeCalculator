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
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var result: String = "0"
    var currentOperation: Operation = .unknwon
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func formattingToDecimal(num: String) {
        numberFormatter.numberStyle = .decimal
        if num.contains(".") {
            guard let naturalNumber = numberFormatter.string(for: Int(num.components(separatedBy: ".")[0]) ?? 0) else { return }
            numberOutputLabel.text = naturalNumber + "." + num.components(separatedBy: ".")[1]
        } else {
            numberOutputLabel.text = numberFormatter.string(for: Int(num) ?? 0)
        }
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        if displayNumber.isEmpty && sender.currentTitle == "0" { return }
        guard let numberValue = sender.currentTitle else { return }
        if displayNumber.count < 10 {
            displayNumber += numberValue
            formattingToDecimal(num: displayNumber)
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        displayNumber = ""
        firstOperand = 0
        secondOperand = 0
        result = "0"
        currentOperation = .unknwon
        numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if displayNumber.count < 9, !displayNumber.contains(".") {
            displayNumber += displayNumber.isEmpty ? "0." : "."
            formattingToDecimal(num: displayNumber)
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        operation(.Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        operation(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        operation(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        operation(currentOperation)
    }
    
    func operating(a: Double, b: Double) {
        guard result.count < 10 else {
            print(result)
            return }
        switch currentOperation {
        case .Add:
            result = "\(a + b)"
        case .Subtract:
            result = "\(a - b)"
        case .Multiply:
            result = "\(a * b)"
        case .Divide:
            result = "\(a / b)"
        default:
            break
        }
        
        if let result = Double(result), result.truncatingRemainder(dividingBy: 1) == 0 {
            self.result = "\(Int(result))"
        }
        firstOperand = Double(result) ?? 0
        formattingToDecimal(num: result)
    }
    
    func operation(_ operation: Operation) {
        if currentOperation != .unknwon {
            if !displayNumber.isEmpty {
                secondOperand = Double(displayNumber) ?? 0
                displayNumber = ""
                operating(a: firstOperand, b: secondOperand)
            } else {
                operating(a: firstOperand, b: secondOperand)
            }
            currentOperation = operation
        } else {
            firstOperand = Double(displayNumber) ?? 0
            currentOperation = operation
            displayNumber = ""
        }
    }
}

