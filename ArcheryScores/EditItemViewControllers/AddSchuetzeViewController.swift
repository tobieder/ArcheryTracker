//
//  AddSchuetzeViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 14.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class AddSchuetzeViewController: UITableViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var result: Result?
    
    var schuetzen=[String]()
    var selected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSchuetzen()
        
        print("viewDidLoad() executed")
        selected = ""
    }
    
    //MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schuetzen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SchuetzeCell"
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SchuetzeTableViewCell else {
            fatalError("The dequeued cell is not an instance of SchuetzeTableViewCell.")
        }
        
        let schuetze = schuetzen[indexPath.row]
        
        
        cell.schuetzeNameLabel.text = schuetze
        
        if schuetze == selected! {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for cell in tableView.visibleCells
        {
            if cell == tableView.cellForRow(at: indexPath)
            {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                selected = schuetzen[indexPath.row]
            }
            else if cell.accessoryType == UITableViewCell.AccessoryType.checkmark
            {
                cell.accessoryType = UITableViewCell.AccessoryType.none
            }
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === backButton else {
            os_log("The back button was not pressed, cancelling.", log: OSLog.default, type: .debug)
            return
        }
        
        //result?.auflage = selected!
    }
    
    //MARK: private Methods
    
    private func loadSchuetzen()
    {
        schuetzen += ["Hans Mayer", "Max Mustermann", "Axel Specht", "Ludwig Maurer"]
    }

}
