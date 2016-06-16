//
//  BaseController.swift
//  easyUnit
//
//  Created by Wu on 6/14/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class BaseController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : UnitCell? = tableView.cellForRowAtIndexPath(indexPath) as! UnitCell?
        if let unit = cell?.unit {
            if let value = cell?.value {
                UnitAPI.sharedUnitAPI.switchSourceUnit(unit, value: value)
                tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell : UnitCell? = tableView.cellForRowAtIndexPath(indexPath) as! UnitCell?
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            if let unit = cell?.unit {
                UnitAPI.sharedUnitAPI.deleteUnit(unit)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .Default, title: "DELETE".localized(), handler: { (action, indexPath) in
            tableView.dataSource?.tableView?(
                tableView,
                commitEditingStyle: .Delete,
                forRowAtIndexPath: indexPath
            )
            return
        })
        deleteButton.backgroundColor = UIColor(red: 49/255, green: 60/255, blue: 69/255, alpha: 1.0)
        return [deleteButton]
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
}