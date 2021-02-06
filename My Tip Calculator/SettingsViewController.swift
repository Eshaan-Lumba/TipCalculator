//
//  SettingsViewController.swift
//  My Tip Calculator
//
//  Created by Eshaan Lumba on 06/02/2021.
//

import UIKit


class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var picker: UIPickerView!
    public var currency = ""
    
    public var completionHandler:((String?) -> Void)?
    var pickerData: [String] = [String]()
    
    
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return pickerData[row]
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["US Dollar", "UK Pound", "Indian Rupee", "Chinese Yuan"]
        
            
    }
    
    @IBAction func didTapSave() {
        //var currency = ""
        let row = self.picker.selectedRow(inComponent: 0)
        if (row == 0) {
            currency = "$"
        } else if (row == 1) {
            currency = "£"
        } else if (row == 2) {
            currency = "₹"
        } else if (row == 3) {
            currency = "¥"
        }
        completionHandler?(currency)
        dismiss(animated: true, completion: nil)
    }
    
   


}
