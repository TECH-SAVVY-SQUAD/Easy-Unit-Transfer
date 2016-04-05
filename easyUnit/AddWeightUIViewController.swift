//
//  AddWeightUIViewController.swift
//  easyUnit
//
//  Created by Wu on 2/26/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class AddWeightUintUITableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var unitSymol: UILabel!
    @IBOutlet weak var unitName: UILabel!
    @IBOutlet weak var unitCountryFlag: UIImageView!
    var unit: Unit = Unit()
    
    func loadCell(unit: Unit) {
        self.unit = unit
        unitSymol.text = unit.symbol
        unitName.text = unit.name
        unitCountryFlag.image = UIImage(named: unit.country)
    }
}

class AddWeightUIViewController: UITableViewController {
    
    let list = Units.getGategorizedUnitList()
    
    @IBOutlet weak var t: UITableView!
    
    @IBAction func closeAddWeightUnitSegue(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        t.tableFooterView = UIView()
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return list.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AddWeightUnitCell", forIndexPath: indexPath) as! AddWeightUintUITableViewCell
        let unit = list[indexPath.section][indexPath.row]
        cell.loadCell(unit)
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : AddWeightUintUITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! AddWeightUintUITableViewCell?
        let unit = cell!.unit
        switch (unit.category) {
        case Category.VOLUME:
            VolumeUnitConverter.getInstance().add(unit)
        case Category.WEIGHT:
            WeightUnitConverter.getInstance().add(unit)
        case Category.LENGTH:
            LengthUnitConverter.getInstance().add(unit)
        default:
            // TODO 
            // throws exception
            return
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let unit = list[section][0]
        switch (unit.category) {
        case Category.VOLUME:
            return "Volume"
        case Category.WEIGHT:
            return "Mass"
        case Category.LENGTH:
            return "Length"
        default:
            return ""
        }
    }
    
    // set the height of UITableViewCell
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }

}
