//
//  VolumeViewController.swift
//  easyUnit
//
//  Created by Wu on 2/22/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController,UITableViewDelegate,UITextFieldDelegate {
    
    var volumeUnitConverter = VolumeUnitConverter.getInstance()
    
    @IBOutlet weak var currentUnitUILabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentValueUITextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUnitUILabel.text = volumeUnitConverter.sourceUnit.symbol
        currentValueUITextField.text = NSString(format:Config.numberOfDigitString, volumeUnitConverter.sourceValue) as String
        tableView.tableFooterView = UIView()
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volumeUnitConverter.targetUnits.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UnitCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("VolumeUnitCell") as! UnitCell
        let unit = volumeUnitConverter.targetUnits[indexPath.row]
        let value = volumeUnitConverter.convert(volumeUnitConverter.sourceUnit, TargetUnit: unit, value: volumeUnitConverter.sourceValue)
        cell.loadCell(unit, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : UnitCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! UnitCell?
        if let unit = cell?.unit {
            if let value = cell?.value {
                let newUnit = volumeUnitConverter.switchSourceUnit(unit, value: value)
                currentUnitUILabel.text = newUnit.symbol
                currentValueUITextField.text = NSString(format:Config.numberOfDigitString, volumeUnitConverter.sourceValue) as String
                tableView.reloadData()
            }
        }
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell : UnitCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! UnitCell?
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            if let unit = cell?.unit {
                volumeUnitConverter.delete(unit)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
    
    // set the height of UITableViewCell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    
    @IBAction func UITextFieldValueInput(sender: UITextField) {
        if let text = sender.text {
            if !text.isEmpty {
                if let number = Double(text) {
                    volumeUnitConverter.sourceValue = number
                    tableView.reloadData()
                }
            }else{
                volumeUnitConverter.sourceValue = 1.0
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func UIButtonAddUnit(sender: UIBarButtonItem) {
        performSegueWithIdentifier("AddUnitFromVolumeSegue", sender: self)
    }
    
    
}
