//
//  TemperatureViewController.swift
//  easyUnit
//
//  Created by Wu on 3/19/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit
class TemperatureUnitCell: UITableViewCell {
    @IBOutlet weak var TemperatureUITableViewCellTitle: UILabel!
    @IBOutlet weak var TemperatureUITableViewCellValue: UILabel!
    var unit: Unit = Unit()
    var value: Double = 1.0
    
    func loadCell(unit: Unit, value: Double) {
        TemperatureUITableViewCellTitle.text = unit.symbol
        TemperatureUITableViewCellValue.text = NSString(format:Config.numberOfDigitString, value) as String
        self.unit = unit
        self.value = value
    }
}


class TemperatureViewController: UIViewController, UITableViewDelegate {
    private var temperatureUnitConverter = TemperatureUnitConverter.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SrcUnitLabel.text = temperatureUnitConverter.sourceUnit.symbol
        SrcUnitValue.text = NSString(format:Config.numberOfDigitString, temperatureUnitConverter.sourceValue) as String
        tableView.tableFooterView = UIView()
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SrcUnitLabel: UILabel!
    @IBOutlet weak var SrcUnitValue: UITextField!
    
    @IBAction func TemperatureUITextFieldInput(sender: UITextField) {
        if let text = sender.text {
            if !text.isEmpty {
                if let number = Double(text) {
                    temperatureUnitConverter.sourceValue = number
                    tableView.reloadData()
                }
            }else{
                temperatureUnitConverter.sourceValue = 1.0
                tableView.reloadData()
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temperatureUnitConverter.targetUnits.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TemperatureUnitCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitCell") as! TemperatureUnitCell
        let unit = temperatureUnitConverter.targetUnits[indexPath.row]
        let value = temperatureUnitConverter.convert(temperatureUnitConverter.sourceUnit, TargetUnit: unit, value: temperatureUnitConverter.sourceValue)
        cell.loadCell(unit, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : TemperatureUnitCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! TemperatureUnitCell?
        if let unit = cell?.unit {
            if let value = cell?.value {
                let newUnit = temperatureUnitConverter.switchSourceUnit(unit, value: value)
                SrcUnitLabel.text = newUnit.symbol
                SrcUnitValue.text = NSString(format:Config.numberOfDigitString, temperatureUnitConverter.sourceValue) as String
                tableView.reloadData()
            }
        }
    }
    
    // set the height of UITableViewCell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
}
