//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Corey Salzer on 12/15/15.
//  Copyright © 2015 Corey Salzer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipAmountOne: UITextField!
    @IBOutlet weak var tipAmountTwo: UITextField!
    @IBOutlet weak var tipAmountThree: UITextField!
    @IBOutlet weak var tipAmountOneLabel: UILabel!
    @IBOutlet weak var tipAmountTwoLabel: UILabel!
    @IBOutlet weak var tipAmountThreeLabel: UILabel!
    weak var defaults: NSUserDefaults!
    
    var tipAmountLabels : [UILabel] = []
    var tipAmountFields : [UITextField] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults.standardUserDefaults()
        tipAmountOneLabel.text = String(Int(defaults.doubleForKey("0")*100)) + "%"
        tipAmountTwoLabel.text = String(Int(defaults.doubleForKey("1")*100)) + "%"
        tipAmountThreeLabel.text = String(Int(defaults.doubleForKey("2")*100)) + "%"
        
        tipAmountOne.text = String(Int(defaults.doubleForKey("0")*100))
        tipAmountOne.textColor = UIColor.lightGrayColor()
        
        tipAmountTwo.text = String(Int(defaults.doubleForKey("1")*100))
        tipAmountTwo.textColor = UIColor.lightGrayColor()
        
        tipAmountThree.text = String(Int(defaults.doubleForKey("2")*100))
        tipAmountThree.textColor = UIColor.lightGrayColor()
        
        tipAmountLabels.append(tipAmountOneLabel)
        tipAmountLabels.append(tipAmountTwoLabel)
        tipAmountLabels.append(tipAmountThreeLabel)
        tipAmountFields.append(tipAmountOne)
        tipAmountFields.append(tipAmountTwo)
        tipAmountFields.append(tipAmountThree)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didBeginEditingOne(sender: UITextField) {
        didBeginEditingWorker(sender)
    }
    
    @IBAction func didBeginEditing(sender: UITextField) {
        didBeginEditingWorker(sender)
    }

    @IBAction func didBeginEditingThree(sender: UITextField) {
        didBeginEditingWorker(sender)
    }
    
    func didBeginEditingWorker (sender: UITextField) {
        if sender.textColor == UIColor.lightGrayColor() {
            sender.text = nil
            sender.textColor = UIColor.blackColor()
        }
    }
    
    @IBAction func didEndEditingOne(sender: UITextField) {
        didEndEditingWorker(sender)
    }

    @IBAction func didEndEditing(sender: UITextField) {
       didEndEditingWorker(sender)
    }
    
    
    @IBAction func didEndEditingThree(sender: UITextField) {
        didEndEditingWorker(sender)
    }
    
    func didEndEditingWorker (sender: UITextField) {
        if sender.text!.isEmpty {
            sender.text = String(Int(defaults.doubleForKey(String(tipAmountFields.indexOf(sender)!))*100))
        }
        sender.textColor = UIColor.lightGrayColor()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChangedOne(sender: UITextField) {
        if Int(sender.text!) != nil {
            if Int(sender.text!) >= 100 {
                sender.text = sender.text?.substringToIndex(sender.text!.startIndex.advancedBy(2))
            }
            else {
                tipAmountLabels[tipAmountFields.indexOf(sender)!].text = sender.text! + "%"
                
                defaults.setDouble(Double(sender.text!)!/100, forKey: String(tipAmountFields.indexOf(sender)!))
                defaults.synchronize()
            }
        }
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }


}
