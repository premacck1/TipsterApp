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
    var tipArr = [0.10,0.20,0.30]
    
    @IBAction func segmentControllerAction(sender: AnyObject) {
        
        self.billTextField.resignFirstResponder();
        let billAmount = Double(billTextField.text!)
        
        let tipPercent = Double(tipArr[segmentedControl.selectedSegmentIndex])
        if(billAmount != nil){
        let tipAmount = tipPercent * billAmount!
        tipLabel.text = "$\(tipAmount)"
        let sum = billAmount! + tipAmount
        totalBilLabel.text = "$\(sum)"
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField .becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Tipster"
    }
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}

