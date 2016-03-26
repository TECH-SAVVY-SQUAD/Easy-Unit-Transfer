//
//  SecondViewController.swift
//  easyUnit
//
//  Created by Wu on 2/22/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class WeightUITableViewCell: UITableViewCell {
    @IBOutlet weak var WeightUITableViewCellTitle: UILabel!
    @IBOutlet weak var WeightUITableViewCellValue: UILabel!
    var unit: Unit = Unit()
    var value = 1.0
    
    func loadCell(unit: Unit, value: Double) {
        WeightUITableViewCellTitle.text = unit.symbol
        WeightUITableViewCellValue.text = NSString(format:Config.numberOfDigitString,value) as String
        self.unit = unit
        self.value = value
    }
}

class WeightViewController: UIViewController, UITableViewDelegate,UITextFieldDelegate {
    
    var weightConverter = WeightUnitConverter.getInstance()
    
    @IBOutlet weak var currentUnitUILabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentValueUITextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUnitUILabel.text = weightConverter.sourceUnit.symbol
        currentValueUITextField.text = NSString(format:Config.numberOfDigitString, weightConverter.sourceValue) as String
        tableView.tableFooterView = UIView()
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        currentUnitUILabel.text = weightConverter.sourceUnit.symbol
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weightConverter.targetUnits.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> WeightUITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitCell") as! WeightUITableViewCell
        let unit = weightConverter.targetUnits[indexPath.row]
        let value = weightConverter.convert(weightConverter.sourceUnit, TargetUnit: unit, value: weightConverter.sourceValue)
        cell.loadCell(unit, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : WeightUITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! WeightUITableViewCell?
        if let unit = cell?.unit {
            if let value = cell?.value {
                let newUnit = weightConverter.switchSourceUnit(unit, value: value)
                currentUnitUILabel.text = newUnit.symbol
                currentValueUITextField.text = NSString(format:Config.numberOfDigitString, weightConverter.sourceValue) as String
                tableView.reloadData()
            }
        }
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell : WeightUITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! WeightUITableViewCell?
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            if let unit = cell?.unit {
                weightConverter.delete(unit)
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
                    weightConverter.sourceValue = number
                    tableView.reloadData()
                }
            }else{
                weightConverter.sourceValue = 1.0
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func UIButtonAddWeightUnit(sender: UIBarButtonItem) {
        performSegueWithIdentifier("AddWeightUnitSegue", sender: self)
    }
}


