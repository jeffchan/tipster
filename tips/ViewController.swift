//
//  ViewController.swift
//  tips
//
//  Created by Jeff Chan on 8/16/14.
//  Copyright (c) 2014 Jeff Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    let model = CalculatorModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaultIndex = model.tipsControlDefaultIndex
        if defaultIndex != nil {
            tipControl.selectedSegmentIndex = defaultIndex
        }
        
        let billAmount = model.billAmount
        if billAmount != 0 {
            billField.text = String(format: "%0.2f", billAmount)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.15, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = (billField.text as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        3
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Persist bill amount
        model.billAmount = billAmount
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

