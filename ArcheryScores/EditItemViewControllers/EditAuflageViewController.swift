//
//  EditAuflageViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 28.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class EditAuflageViewController: UITableViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var result: Result?
    
    var auflagen=[Auflage]()
    var selected: Auflage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAuflagen()
        
        if(result == nil) {
            selected = auflagen[0]
        }
        else {
            selected = result!.auflage
        }
    }
    
    //MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return auflagen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AuflageCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AuflageTableViewCell else {
            fatalError("The dequeued cell is not an instance of AuflageTableViewCell.")
        }
        
        let auflage = auflagen[indexPath.row]
        
        cell.auflageImage.image = auflage.auflage
        cell.auflageNameLabel.text = auflage.name
        
        if auflage.name == selected!.name && auflage.auflage == selected!.auflage {
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
                selected = auflagen[indexPath.row]
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
        
        result?.auflage = selected!
    }
    
    //MARK: private Methods
    
    private func loadAuflagen()
    {
        
        let photo1 = UIImage(named: "result1")
        let photo2 = UIImage(named: "result2")
        
        let a122cm = Auflage(name: "122cm", auflage: photo1)
        let a80cm = Auflage(name: "80cm", auflage: photo1)
        let a60cm = Auflage(name: "60cm", auflage: photo1)
        let a40cm = Auflage(name: "40cm", auflage: photo1)
        let spot40cm = Auflage(name: "Spot 40cm", auflage: photo2)
        let spot3er = Auflage(name: "3er-Spot", auflage: photo2)
        let spot3erComp = Auflage(name: "3er-Spot Compound", auflage: photo2)
        
        auflagen += [a122cm, a80cm, a60cm, a40cm, spot40cm, spot3er, spot3erComp]
    }

}
