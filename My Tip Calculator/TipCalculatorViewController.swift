//
//  TipCalculatorViewController.swift
//  My Tip Calculator
//
//  Created by Eshaan Lumba on 12/01/2021.
//

import UIKit
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        return formatter
    }()
}
extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

class TipCalculatorViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleStepper: UIStepper!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var eachPersonAmount: UILabel!
    
    
    @IBOutlet weak var currencyTotal: UILabel!
    @IBOutlet weak var currencyTotalAmount: UILabel!
    @IBOutlet weak var currencyEachPerson: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //Leaves value for <10 mins
        amountBeforeTaxTextField?.delegate = self
        amountBeforeTaxTextField.becomeFirstResponder()
        let userDefaults = UserDefaults.standard;
        if let timedArray = userDefaults.object(forKey: "timedString") as? NSArray {
          if let aThen = timedArray.lastObject as? NSDate  {
            if ((NSDate.timeIntervalSinceReferenceDate - aThen.timeIntervalSinceReferenceDate) < 10*60) {
                amountBeforeTaxTextField!.text = timedArray.firstObject as? String
            }
          }
        }
      }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let a = NSArray(arrayLiteral: textField.text!, NSDate())
        let userDefaults = UserDefaults.standard;
        userDefaults.set(a, forKey:"timedString");
      }
      
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
      }
    
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        totalResultLabel.text = String(format: "%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleStepper.value)
        eachPersonAmount.text = String(format: "%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
        totalTipLabel.text = String(format: "%0.2f", tipCalculator.tipAmount)
        
        totalResultLabel.text = currencyFormatter.string(from: NSNumber(value: tipCalculator.totalAmount))!
        
        totalTipLabel.text = currencyFormatter.string(from: NSNumber(value: tipCalculator.tipAmount))!
        
        eachPersonAmount.text = currencyFormatter.string(from: NSNumber(value: tipCalculator.totalAmount / Double(numberOfPeople)))!    
        
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
