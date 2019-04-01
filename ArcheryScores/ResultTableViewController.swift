//
//  ResultTableViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 11.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class ResultTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var results=[Result]()
    var settings = Settings(email: "test", passwort: "test", trainerMode: true)

    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var statisticButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        statisticButton.title = NSString(string: "\u{1F4C8}\u{0000FE0E}") as String
        statisticButton.style = .plain
        
        settingsButton.title = NSString(string: "\u{2699}\u{0000FE0E}") as String
        settingsButton.style = .plain
        
        let font = UIFont.systemFont(ofSize: 28) 
        let attributes = [NSAttributedString.Key.font : font]
        
        settingsButton.setTitleTextAttributes(attributes, for: .normal)
        
        // Load any saved meals, otherwise load sample data.
        if let savedResults = loadResults() {
            results += savedResults
        }
        else {
            // Load the sample data.
            loadSampleResults()
        }
        
        if results.count == 0 {
            loadSampleResults()
        }
        
        // Load saved settings, otherwise load sample settings.
        if let savedSettings = loadSettings() {
            settings = savedSettings
        }
        else {
            // Load the sample settings.
            loadSampleSettings()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ResultTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ResultTableViewCell else {
            fatalError("The dequeued cell is not an instance of ResultTableViewCell.")
        }
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        //Fetches the appropriate meal for the data source layout.
        let result = results[indexPath.row]
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd.MM.yyyy"

        cell.nameLabel.text = result.name
        cell.dateLabel.text = dateformatter.string(from: result.date)
        cell.photoImageView.image = result.auflage.auflage
        cell.resultLabel.text =  String(result.result)

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            results.remove(at: indexPath.row)
            saveResults()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new result.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let resultDetailViewController = segue.destination as? ResultSetupTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedResultCell = sender as? ResultTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedResultCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedResult = results[indexPath.row]
            print(selectedResult.name)
            resultDetailViewController.THISresult = selectedResult
        case "Settings":
            os_log("Settings selected.", log: OSLog.default, type: .debug)
            guard let settingsTableViewController = segue.destination as? SettingsTableViewController else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            settingsTableViewController.THISsettings = settings
        case "showStats":
            os_log("Show Stats.", log: OSLog.default, type: .debug)
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    
    //MARK: Actions
    @IBAction func unwindToResultList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ResultSetupTableViewController, let result = sourceViewController.THISresult {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing result.
                results[selectedIndexPath.row] = result
                print("---------------")
                print(results[selectedIndexPath.row].auflage.name)
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                print("New result saved to the Result Table.")
            }
            else {
            
                // Add a new meal.
                let newIndexPath = IndexPath(row: results.count, section: 0)
            
                results.append(result)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            saveResults()
        }
        if let sourceViewController = sender.source as? SettingsTableViewController, let GOTsettings = sourceViewController.THISsettings {
            settings = GOTsettings
            
            saveSettings()
        }
    }
    
    //MARK: Private Methods
    
    private func loadSampleResults(){
        let photo1 = UIImage(named: "result1")
        let photo2 = UIImage(named: "result2")
        let photo3 = UIImage(named: "result1")
        
        let auflage1 = Auflage(name: "122cm", auflage: photo1)
        let auflage2 = Auflage(name: "Spot", auflage: photo2)
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        //TODO: Currently todays date.
        let date1 = dateFormatter.date(from: "18.12.2018") as! Date
        let date2 = dateFormatter.date(from: "12.12.2018") as! Date
        let date3 = dateFormatter.date(from: "29.11.2018") as! Date
        let date4 = dateFormatter.date(from: "03.01.2019") as! Date
        
        
        guard let result1 = Result(name: "Training 1", date: date1, auflage: auflage1, round1_result: 47, round1_image: photo1, round2_result: 49, round2_image: photo1, round3_result: 51, round3_image: photo1, round4_result: 46, round4_image: photo1, round5_result: 48, round5_image: photo1, round6_result: 51, round6_image: photo1) else {
            fatalError("Unable to instantiate result1")
        }
        
        guard let result2 = Result(name: "Gaumeisterschaft", date: date2, auflage: auflage1, round1_result: 53, round1_image: photo2, round2_result: 52, round2_image: photo2, round3_result: 52, round3_image: photo2, round4_result: 48, round4_image: photo2, round5_result: 42, round5_image: photo2, round6_result: 52, round6_image: photo2) else {
            fatalError("Unable to instantiate result2")
        }
        
        guard let result3 = Result(name: "Training 2", date: date3, auflage: auflage1, round1_result: 50, round1_image: photo3, round2_result: 50, round2_image: photo3, round3_result: 51, round3_image: photo3, round4_result: 52, round4_image: photo3, round5_result: 49, round5_image: photo3, round6_result: 50, round6_image: photo3) else {
            fatalError("Unable to instantiate result3")
        }
        
        guard let result4 = Result(name: "Training 3 (Forts.)", date: date4, auflage: auflage2, round1_result: 48, round1_image: photo3, round2_result: 42, round2_image: photo3, round3_result: 0, round3_image: nil, round4_result: 0, round4_image: nil, round5_result: 0, round5_image: nil, round6_result: 0, round6_image: nil) else {
            fatalError("Unable to instantiate result4")
        }
    
        
        results += [result1, result2, result3, result4]
        
       
        
    }
    
    private func loadSampleSettings() {
         settings = Settings(email: "beispiel.email@adresse.de", passwort: "strengGeheim", trainerMode: false)
    }
    
    private func saveResults() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(results, toFile: Result.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Results successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save results...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadResults() -> [Result]? {
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: Result.ArchiveURL.path) as? [Result]
    }
    
    private func saveSettings() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(settings, toFile: Settings.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Settings successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save settings...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadSettings() -> Settings? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Settings.ArchiveURL.path) as? Settings
    }

}
