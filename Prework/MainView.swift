//
//  ViewController.swift
//  Prework
//
//  Created by OSL on 12/9/21.
//

import UIKit

class MainView: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl2: UISlider!
    @IBOutlet weak var userTipLabel: UILabel!

    var minTip = Float()
    var maxTip = Float()
    var defaultTip = Float()
    
    func formatToPerc(number: NSNumber) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 3
        formatter.maximumFractionDigits = 0
        return formatter.string(from: number)!
    }
    
    func formatToCurrency(number: NSNumber) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: number)!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipControl2.minimumValue = minTip / 100.0
        tipControl2.maximumValue = maxTip / 100.0
        tipControl2.value = defaultTip / 100.0
        userTipLabel.text = formatToPerc(number: NSNumber(value: tipControl2.value))
        billAmountTextField.placeholder = formatToCurrency(number: 0)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field
       
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // set slider step to 2 decimal place
        let stepTip = round(tipControl2.value * 100)/100.0
        tipControl2.setValue(stepTip, animated: true)
        
        let userTipPerc = Double(tipControl2.value)
        let tip = bill * userTipPerc
        let total = bill + tip
        
        // update labels
//        billAmountTextField.text = formatToCurrency(number: NSNumber(value: bill))
        userTipLabel.text = formatToPerc(number: NSNumber(value: tipControl2.value))
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

