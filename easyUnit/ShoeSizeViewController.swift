//
//  ShoeSizeViewController.swift
//  easyUnit
//
//  Created by Wu on 2/27/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class ShoeSizeUITableViewCell: UITableViewCell {
    @IBOutlet weak var ShoeSizeUITableViewCellTitle: UILabel!
    @IBOutlet weak var ShoeSizeUITableViewCellValue: UILabel!
    private(set) var title: String = ""
    private(set) var value: String = ""
    
    func loadCell(title: String, value: String) {
        ShoeSizeUITableViewCellTitle.text = title
        ShoeSizeUITableViewCellValue.text = value
        self.title = title
        self.value = value
    }
    
    func updateUITableViewCellValue(value: String) {
        ShoeSizeUITableViewCellTitle.text = value
        self.value = value
    }
    
    func updateUITableViewCellTitle(title: String){
        ShoeSizeUITableViewCellValue.text = title
        self.title = title
    }
}

class ShoeSizeViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentShoeSizeUITextField: UITextField!
    var shoeSizeConverter = ShoeSizeConverter.getInstance()
    
    @IBOutlet weak var currentUnitUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        // remove the navigation bar board
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoeSizeConverter.getDisplayUnitArray().count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ShoeSizeUITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ShoeSizeUnitCell") as! ShoeSizeUITableViewCell
        let title = shoeSizeConverter.getDisplayUnitArray()[indexPath.row]
        let value = shoeSizeConverter.getShoeSize(title)
        cell.loadCell(title, value: value)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : ShoeSizeUITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath) as! ShoeSizeUITableViewCell?
        if let title = cell?.title {
            currentUnitUILabel.text = title
            shoeSizeConverter.switchUnit(title)
            currentShoeSizeUITextField.text = shoeSizeConverter.getShoeSize(title)
            tableView.reloadData()
        }
        print(indexPath.row)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    @IBAction func UITextFieldShoeSizeInput(sender: UITextField) {
        if let text = sender.text {
            if !text.isEmpty {
                if let number = Double(text) {
                    shoeSizeConverter.setShoeSize(number)
                    tableView.reloadData()
                }
            }else{
                shoeSizeConverter.setShoeSize(0)
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func UIBarButtonItemShowSetting(sender: UIBarButtonItem) {
        performSegueWithIdentifier("ShoeSizeSettingSegue", sender: self)
    }
}
