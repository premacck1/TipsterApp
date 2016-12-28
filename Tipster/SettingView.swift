//
//  SettingView.swift
//  Tipster
//
//  Created by Prem Ankur on 12/27/16.
//  Copyright © 2016 Prem Ankur. All rights reserved.
//

import UIKit

class SettingView: UIViewController {

    @IBOutlet weak var tipDefaultSegment: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults()
    var tipArr = [0.10,0.20,0.30]
    
    @IBAction func segmentControllerAction(sender: AnyObject) {
       
        //Saving default tip percentage in User Defaults
        let tipPercent = Double(tipArr[tipDefaultSegment.selectedSegmentIndex])
        defaults.setValue(tipPercent, forKey: "tipDefault")
        defaults.synchronize()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Retrieving tip defaults on load
        let tipDefault = defaults.doubleForKey("tipDefault")
        if(tipDefault == 0.10){
            tipDefaultSegment.selectedSegmentIndex = 0
        }else if(tipDefault==0.20){
            tipDefaultSegment.selectedSegmentIndex = 1
        }else if(tipDefault==0.30){
            tipDefaultSegment.selectedSegmentIndex = 2
        }else{
            tipDefaultSegment.selectedSegmentIndex = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
