//
//  VolumeViewController.swift
//  easyUnit
//
//  Created by Wu on 2/22/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class VolumeViewController: BaseController, UITextFieldDelegate {
    
    @IBOutlet weak var currentUnitUILabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentValueUITextField: DecimalTextField!
    
    @IBOutlet weak var currentUnitCountryFlag: UIImageView!
    
    @IBOutlet weak var currentUnitName: UILabel!
    
    private var sourceValue = 0.0
    
    @IBAction func UITextFieldValueInput(sender: UITextField) {
        if let text = sender.text {
            if !text.isEmpty {
                if let number = Double(text) {
                    sourceValue = number
                }
            }else{
                sourceValue = 1.0
            }
            tableView.reloadData()
        }
    }
    
    @IBAction func UIButtonAddUnit(sender: UIBarButtonItem) {
        performSegueWithIdentifier("AddUnitFromVolumeSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
        tableView.tableFooterView = UIView()
        
        currentValueUITextField.delegate = currentValueUITextField
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.topItem?.title = "LENGTH".localized()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.updateView()
    }
    
    func updateView() {
        let sourceUnit = UnitAPI.sharedUnitAPI.getSourceUnitForLength()
        let sourceValue = UnitAPI.sharedUnitAPI.getSourceValueForLength()
        currentUnitUILabel.text = sourceUnit.symbol.localized()
        currentValueUITextField.text = NSString(format:"%.\(Config.getInstance().numberOfDigits)f", sourceValue) as String
        currentUnitCountryFlag.image = UIImage(named: sourceUnit.country.getString())
        currentUnitName.text = sourceUnit.name.localized()
        tableView.reloadData()
    }
}

extension LengthViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UnitAPI.sharedUnitAPI.getTaregetUnitsForLength().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitCell") as! UnitCell
        let unit = UnitAPI.sharedUnitAPI.getTaregetUnitsForLength()[indexPath.row]
        let value = UnitAPI.sharedUnitAPI.convert(UnitAPI.sharedUnitAPI.getSourceUnitForLength(), target: unit, value: sourceValue)
        cell.loadCell(unit, value: value)
        
        return cell
    }
}
