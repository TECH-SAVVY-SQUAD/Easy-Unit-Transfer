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
    var title: String = ""
    var value = 1.0
    
    func loadCell(title: String, value: Double) {
        WeightUITableViewCellTitle.text = title
        WeightUITableViewCellValue.text = NSString(format:"%.2f",value) as String
        self.title = title
        self.value = value
    }
    
    func updateUITableViewCellValue(value: Double) {
        WeightUITableViewCellValue.text = NSString(format:"%.2f",value) as String
        self.value = value
    }
    
    func updateUITableViewCellTitle(title: String){
        WeightUITableViewCellTitle.text = title
        self.title = title
    }
}

class WeightViewController: UIViewController, UITableViewDelegate,UITextFieldDelegate {
    
    var weightConverter = WeightConverter.getWeightConverter()
    
    @IBOutlet weak var currentUnitUILabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentValueUITextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        currentUnitUILabel.text = weightConverter.currentUnit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weightConverter.getDisplayUnitArray().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> WeightUITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitCell") as! WeightUITableViewCell
        let title = weightConverter.getDisplayUnitArray()[indexPath.row].symbol
        let value = weightConverter.getWeight(title)
        cell.loadCell(title, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : WeightUITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! WeightUITableViewCell?
        if let title = cell?.title {
            currentUnitUILabel.text = title
            weightConverter.switchUnit(title)
            currentValueUITextField.text = NSString(format:"%.2f",weightConverter.getWeight(title)) as String 
            tableView.reloadData()
        }
        print(indexPath.row)
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell : WeightUITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! WeightUITableViewCell?
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            if let title = cell?.title {
                weightConverter.deleteUnit(title)
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
                    weightConverter.setWeight(number)
                    tableView.reloadData()
                }
            }else{
                weightConverter.setWeight(1.0)
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func UIButtonAddWeightUnit(sender: UIBarButtonItem) {
        performSegueWithIdentifier("AddWeightUnitSegue", sender: self)
    }
}


