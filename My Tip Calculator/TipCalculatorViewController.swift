//
//  TipCalculatorViewController.swift
//  My Tip Calculator
//
//  Created by Eshaan Lumba on 12/01/2021.
//

import UIKit

class TipCalculatorViewController: UIViewController
{
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleStepper: UIStepper!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var totalTipLabel: UILabel!
    
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var eachPersonAmount: UILabel!
    
    
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.becomeFirstResponder()
    }
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleStepper.value)
        eachPersonAmount.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
        totalTipLabel.text = String(format: "$%0.2f", tipCalculator.tipAmount)
    }
    
    
    
    
    @IBAction func tipSliderValueChanged(sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    
    @IBAction func numberOfPeopleStepperValueChanged(sender: Any) {
        numberOfPeopleLabel.text = "Party Size: \(Int(numberOfPeopleStepper.value))"
        calculateBill()
        
    }
    
    @IBAction func amountBeforeTaxTextfieldChanged(sender: Any){
        calculateBill()
    }
    
    
}
