//
//  ViewController.swift
//  Tipster
//
//  Created by Prem Ankur on 11/23/16.
//  Copyright © 2016 Prem Ankur. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var totalBilLabel: UILabel!
    //Tip Value Array
    var tipArr = [0.10,0.20,0.30]
    // UserDefaults to retrieve default tip amount
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    //When a tip percent in segment control is selected
    @IBAction func segmentControllerAction(sender: AnyObject) {
        
        self.billTextField.resignFirstResponder();
        let billAmount = Double(billTextField.text!)
        //Calculating the tip amount from the selected tip percent
        let tipPercent = Double(tipArr[segmentedControl.selectedSegmentIndex])
        if(billAmount != nil){
        let tipAmount = tipPercent * billAmount!
        tipLabel.text = "$\(tipAmount)"
        let sum = billAmount! + tipAmount
        //Displaying the total bill amount after Calculation
        totalBilLabel.text = "$\(sum)"
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField .becomeFirstResponder()
        //Select the default tip percentage when view loads
        let tipDefault = defaults.doubleForKey("tipDefault")
        if(tipDefault==0.10){
                    segmentedControl.selectedSegmentIndex = 0
        }else if(tipDefault==0.20){
                    segmentedControl.selectedSegmentIndex = 1
        }else if(tipDefault==0.30){
                    segmentedControl.selectedSegmentIndex = 2
        }else{
                    segmentedControl.selectedSegmentIndex = 0
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        //Setting the Navigation Bar title
        self.navigationItem.title = "Tipster"
    }
    
    //When the User starts typing the bill amount in the text box
    @IBAction func onEditingChanged(sender: UITextField) {
        let billAmount = Double(billTextField.text!)
        
        let tipPercent = Double(tipArr[segmentedControl.selectedSegmentIndex])
        if(billAmount != nil){
        let tipAmount = tipPercent * billAmount!
        tipLabel.text = "$\(tipAmount)"
        let sum = billAmount! + tipAmount
        totalBilLabel.text = "$\(sum)"}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true);
        
    }
    //Removing the keypad
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}

