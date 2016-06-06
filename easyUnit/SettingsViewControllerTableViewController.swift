//
//  SettingsViewControllerTableViewController.swift
//  easyUnit
//
//  Created by Wu on 6/5/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class SettingsViewControllerTableViewController: UITableViewController {
    
    // Current language lable.
    @IBOutlet weak var CurrentLanguageLabel: UILabel!
    
    // Current precision label.
    @IBOutlet weak var CurrentPrecisionLabel: UILabel!
    
    // Current precision slider.
    @IBOutlet weak var CurrentPrecisionSlider: UISlider!
    
    // Close settings page action.
    @IBAction func closeSettingsSegue(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentLanguageLabel.text = Config.getInstance().language.getString()
        CurrentPrecisionLabel.text = String(Config.getInstance().numberOfDigits)
        CurrentPrecisionSlider.value = Float(Config.getInstance().numberOfDigits)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func UpdatePrecisionAction(sender: UISlider) {
        let value = Float(round(CurrentPrecisionSlider.value))
        sender.setValue(value, animated: true)
        CurrentPrecisionLabel.text = String(Int(value))
        Config.getInstance().numberOfDigits = Int(value)
    }
    
}
