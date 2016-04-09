//
//  TemperatureViewController.swift
//  easyUnit
//
//  Created by Wu on 3/19/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController, UITableViewDelegate {
    private var temperatureUnitConverter = TemperatureUnitConverter.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SrcUnitLabel.text = temperatureUnitConverter.sourceUnit.symbol
        SrcUnitValue.text = NSString(format:Config.numberOfDigitString, temperatureUnitConverter.sourceValue) as String
        SrcUnitName.text = temperatureUnitConverter.sourceUnit.name
        SrcUnitCountryFlag.image = UIImage(named: temperatureUnitConverter.sourceUnit.country)
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColorUtil.blueRangeUIColor(temperatureUnitConverter.sourceValue)
        
        SrcUnitValue.delegate = SrcUnitValue
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SrcUnitLabel: UILabel!
    @IBOutlet weak var SrcUnitValue: DecimalTextField!
    @IBOutlet weak var SrcUnitName: UILabel!
    @IBOutlet weak var SrcUnitCountryFlag: UIImageView!
    
    @IBAction func TemperatureUITextFieldInput(sender: UITextField) {
        if let text = sender.text {
            if !text.isEmpty {
                if let number = Double(text) {
                    temperatureUnitConverter.sourceValue = number
                    tableView.backgroundColor = UIColorUtil.blueRangeUIColor(temperatureUnitConverter.sourceValue)
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UnitCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TemperatureUnitCell") as! UnitCell
        let unit = temperatureUnitConverter.targetUnits[indexPath.row]
        let value = temperatureUnitConverter.convert(temperatureUnitConverter.sourceUnit, TargetUnit: unit, value: temperatureUnitConverter.sourceValue)
        cell.backgroundColor = UIColorUtil.blueRangeUIColor(temperatureUnitConverter.sourceValue)
        cell.loadCell(unit, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : UnitCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! UnitCell?
        if let unit = cell?.unit {
            if let value = cell?.value {
                let newUnit = temperatureUnitConverter.switchSourceUnit(unit, value: value)
                SrcUnitLabel.text = newUnit.symbol
                SrcUnitValue.text = NSString(format:Config.numberOfDigitString, temperatureUnitConverter.sourceValue) as String
                SrcUnitName.text = newUnit.name
                SrcUnitCountryFlag.image = UIImage(named: unit.country)
                tableView.reloadData()
            }
        }
    }
}
