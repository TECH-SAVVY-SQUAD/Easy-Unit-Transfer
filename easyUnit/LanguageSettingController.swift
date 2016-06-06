//
//  LanguageSettingController.swift
//  easyUnit
//
//  Created by Wu on 6/5/16.
//  Copyright © 2016 Jiadong Wu. All rights reserved.
//

import UIKit

class LanguageSettingController: UITableViewController {

    @IBOutlet var talbeView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initChecks()
    }
    
    override func viewDidAppear(animated: Bool) {
        initChecks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        resetChecks()
        if let cell = self.talbeView.cellForRowAtIndexPath(indexPath) {
            if(cell.accessoryType != .Checkmark) {
                if let language = Language(rawValue: indexPath.row) {
                    Config.getInstance().language = language
                    cell.accessoryType = .Checkmark
                    cell.selectionStyle = UITableViewCellSelectionStyle.Blue
                }
            }
        }
    }
    
    // We only have one section in language setting.
    func initChecks() {
        for j in 0...tableView.numberOfRowsInSection(0) - 1 {
            if let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: j, inSection: 0)) {
                if j == Config.getInstance().language.rawValue {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            }
        }
    }
    
    func resetChecks() {
        for i in 0...tableView.numberOfSections-1 {
            for j in 0...tableView.numberOfRowsInSection(i) - 1 {
                if let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: j, inSection: i)) {
                    cell.accessoryType = .None
                }
            }
        }
    }

    @IBAction func LanguageSettingCancelSegue(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
