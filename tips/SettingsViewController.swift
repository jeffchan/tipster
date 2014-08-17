//
//  SettingsViewController.swift
//  tips
//
//  Created by Jeff Chan on 8/16/14.
//  Copyright (c) 2014 Jeff Chan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipsControl: UISegmentedControl!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    let model = CalculatorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaultIndex = model.tipsControlDefaultIndex
        if defaultIndex != nil {
            defaultTipsControl.selectedSegmentIndex = defaultIndex
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipsChange(sender: AnyObject) {
        let selectedIndex = defaultTipsControl.selectedSegmentIndex
        model.tipsControlDefaultIndex = selectedIndex
    }

    @IBAction func closeAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
