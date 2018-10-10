//
//  ViewController.swift
//  Fancy Calculator
//
//  Created by Vayunandan reddy Kunduru on 10/10/18.
//  Copyright © 2018 Vayunandan reddy Kunduru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentOperator: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNum
    
    var firstValue: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func numberClicked(_ sender: UIButton) {
        updateDisplay (number: String(sender.tag))
        
    }
    func updateDisplay (number: String){
        if calcState == CalculationState.newNumStarted{
            if let num = resultLabel.text{
                if num != ""{
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum{
            resultLabel.text = resultLabel.text! + number
        }
    }
    @IBAction func operatorClicked(_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text{
            if num != ""{
                firstValue = num
                resultLabel.text = ""
            }
        }
        switch sender.tag {
        case 10:
            currentOperator = Operator.add
        case 11:
            currentOperator = Operator.subtract
        case 12:
            currentOperator = Operator.times
        case 13:
            currentOperator = Operator.divide
        default:
            return
        }
    }
    @IBAction func equalsClicked(_ sender: UIButton) {
        calculateSum()
    }
    
    func calculateSum(){
        if (firstValue.isEmpty){
            return
        }
        var result = ""
        
        if currentOperator == Operator.times{
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }else if currentOperator == Operator.divide{
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }else if currentOperator == Operator.add{
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }else if currentOperator == Operator.subtract{
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

