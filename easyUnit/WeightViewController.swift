//
//  SecondViewController.swift
//  easyUnit
//
//  Created by Wu on 2/22/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITableViewDelegate {
    
    var weightConverter = WeightUnitConverter.getInstance()
    
    @IBOutlet weak var currentUnitUILabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentValueUITextField: DecimalTextField!
    @IBOutlet weak var currentUnitCoutryFlag: UIImageView!

    @IBOutlet weak var currentUnitName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO add a sperate class for the upper view, load it in anywhere
        currentUnitUILabel.text = weightConverter.sourceUnit.symbol
        currentValueUITextField.text = NSString(format:"%.\(Config.numberOfDigits)f", weightConverter.sourceValue) as String
        currentUnitName.text = weightConverter.sourceUnit.name
        currentUnitCoutryFlag.image = UIImage(named: weightConverter.sourceUnit.country.getString())
        
        // make the table view fill the screen
        tableView.tableFooterView = UIView()
        
        currentValueUITextField.delegate = currentValueUITextField
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
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
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UnitCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("WeightUnitCell") as! UnitCell
        let unit = weightConverter.targetUnits[indexPath.row]
        let value = weightConverter.convert(weightConverter.sourceUnit, TargetUnit: unit, value: weightConverter.sourceValue)
        cell.loadCell(unit, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : UnitCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! UnitCell?
        if let unit = cell?.unit {
            if let value = cell?.value {
                let newUnit = weightConverter.switchSourceUnit(unit, value: value)
                currentUnitUILabel.text = newUnit.symbol
                currentValueUITextField.text = NSString(format:"%.\(Config.numberOfDigits)f", weightConverter.sourceValue) as String
                currentUnitName.text = newUnit.name
                currentUnitCoutryFlag.image = UIImage(named: newUnit.country.getString())
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
                weightConverter.delete(unit)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action, indexPath) in
            self.tableView.dataSource?.tableView?(
                self.tableView,
                commitEditingStyle: .Delete,
                forRowAtIndexPath: indexPath
            )
            return
        })
        
        deleteButton.backgroundColor = UIColor(red: 49/255, green: 60/255, blue: 69/255, alpha: 1.0)
        
        return [deleteButton]
        
    }
    
    
    // set the height of UITableViewCell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 80
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
        performSegueWithIdentifier("AddUnitFromWeightSegue", sender: self)
    }
}


