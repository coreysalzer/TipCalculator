//
//  ViewController.swift
//  TipCalculator
//
//  Created by Corey Salzer on 12/5/15.
//  Copyright (c) 2015 Corey Salzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var defaults: NSUserDefaults!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
        
        
        let billAmount = defaults.doubleForKey("billAmount")
        if billAmount != 0.0 {
            billField.text = "$" + String(billAmount)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let billAmount = defaults.doubleForKey("billAmount")
        if billAmount != 0.0 {
            billField.text = "$" + String(billAmount)
        }
        
        tipControl.setTitle(String(Int(defaults.doubleForKey("0")*100)) + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(Int(defaults.doubleForKey("1")*100)) + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(Int(defaults.doubleForKey("2")*100)) + "%", forSegmentAtIndex: 2)
        
        if billField.text != "" {
            calculateNewValues()
        }
        
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        defaults.setValue(NSDate(), forKey: "previous_time")
        
        if billField.text != "" {
            let strBillField = billField.text?.substringFromIndex(billField.text!.startIndex.advancedBy(1))
            let billAmount = NSString(string: strBillField!).doubleValue
            defaults.setDouble(billAmount, forKey: "billAmount")
        }
        else {
            defaults.setDouble(0.0, forKey: "billAmount")
        }
        
        defaults.synchronize()
        
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func onBillChanged(sender: UITextField) {
        if sender.text != "" {
            calculateNewValues()
            if sender.text![(sender.text?.startIndex)!] != "$" {
                sender.text = "$" + sender.text!
            }
        }
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateNewValues()
    }
    
    func calculateNewValues() {
        if billField.text != "" {
            let tipPercentage = defaults.doubleForKey(String(tipControl.selectedSegmentIndex))

            let strBillField = billField.text?.substringFromIndex(billField.text!.startIndex.advancedBy(1))
            
            let billAmount = NSString(string: strBillField!).doubleValue
            defaults.setDouble(billAmount, forKey: "billAmount")
            defaults.synchronize()
            
            let tip = billAmount * tipPercentage
            
            let total = billAmount + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    
}

