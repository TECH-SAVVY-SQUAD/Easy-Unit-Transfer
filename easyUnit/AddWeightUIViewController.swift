//
//  AddWeightUIViewController.swift
//  easyUnit
//
//  Created by Wu on 2/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class AddWeightUintUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var AddWeightUnitCellContryUILabel: UILabel!
    @IBOutlet weak var AddWeightUnitTitleUILabel: UILabel!
    var unit: Unit = Unit()
    
    func loadCell(unit: Unit) {
        self.unit = unit
        AddWeightUnitCellContryUILabel.text = unit.country
        AddWeightUnitTitleUILabel.text = unit.symbol
    }
}

class AddWeightUIViewController: UITableViewController {
    
    var weightConverter = WeightUnitConverter.getInstance()
    
    @IBOutlet weak var t: UITableView!
    
    @IBAction func closeAddWeightUnitSegue(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        //view.addGestureRecognizer(tap)
        
        t.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Units.weightUnits.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> AddWeightUintUITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AddWeightUnitCell") as! AddWeightUintUITableViewCell
        let unit = Units.weightUnits[indexPath.row]
        cell.loadCell(unit)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : AddWeightUintUITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! AddWeightUintUITableViewCell?
        weightConverter.add(cell!.unit)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // set the height of UITableViewCell
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }

}
