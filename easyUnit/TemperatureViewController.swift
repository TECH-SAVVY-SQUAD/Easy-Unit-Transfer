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
    var title: String = ""
    var value = 1.0
    
    func loadCell(title: String, value: Double) {
        TemperatureUITableViewCellTitle.text = title
        TemperatureUITableViewCellValue.text = NSString(format:"%.1f",value) as String
        self.title = title
        self.value = value
    }
    
    func updateUITableViewCellValue(value: Double) {
        TemperatureUITableViewCellValue.text = NSString(format:"%.1f",value) as String
        self.value = value
    }
    
    func updateUITableViewCellTitle(title: String){
        TemperatureUITableViewCellTitle.text = title
        self.title = title
    }
}


class TemperatureViewController: UIViewController, UITableViewDelegate {
    private var inputValue = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                    self.inputValue = number
                    tableView.reloadData()
                }
            }else{
                self.inputValue = 1.0
                tableView.reloadData()
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let except = SrcUnitLabel.text {
            return TemperatureUnitConverter.getUnitsList(except).count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TemperatureUnitCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitCell") as! TemperatureUnitCell
        let title = TemperatureUnitConverter.getUnitsList(SrcUnitLabel.text!)[indexPath.row].symbol
        let value = TemperatureUnitConverter.convert(SrcUnitLabel.text!, to: title, value: inputValue)
        cell.loadCell(title, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : TemperatureUnitCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! TemperatureUnitCell?
        if let title = cell?.title {
            SrcUnitLabel.text = title
            SrcUnitValue.text = NSString(format:"%.1f",(cell?.value)!) as String
            tableView.reloadData()
        }
    }
    
    // set the height of UITableViewCell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
}
