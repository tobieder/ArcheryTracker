//
//  ResultSetupTableViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 28.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//


import Foundation
import UIKit
import os.log

class ResultSetupTableViewController : UITableViewController, UINavigationControllerDelegate{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var auflageLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    /*
     This value is either passed by 'ResultTableViewController' in 'prepare(for:sender)'
     or constructed as part of adding a new meal.
     */
    var THISresult: Result?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd.MM.yyyy"
        
        if(THISresult == nil)
        {
            THISresult = Result(name: nameLabel.text!, date: NSDate() as Date, auflage: Auflage(name: "Test", auflage: nil), round1_result: 48, round1_image: nil, round2_result: 51, round2_image: nil, round3_result: 46, round3_image: nil, round4_result: 50, round4_image: nil, round5_result: 52, round5_image: nil, round6_result: 51, round6_image: nil)
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd.MM.yyyy"
            
            nameLabel.text = "Name eingeben."
            dateLabel.text = dateformatter.string(from: THISresult!.date)
            auflageLabel.text = "Auflage wählen."
        }
        else {
            if let result = THISresult {
                nameLabel.text = result.name
                dateLabel.text = dateformatter.string(from: result.date)
                auflageLabel.text = result.auflage.name
            }
        }
    }
    
    //MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        //Depending on style of presentation (moadl or push presentation), this view controller needs to be dismissed in two different ways.
        
        print("Cancel pressed.")
        let isPresentingInAddResultMode = presentingViewController is UINavigationController
        
        if isPresentingInAddResultMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The ResultViewController is not inside a navigation controller.")
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "EditName":
            guard let editNameViewController = segue.destination as? EditNameViewController
                else {
                    fatalError("Uexpected destination: \(segue.destination)")
                }
            
            editNameViewController.result = THISresult
            
            //editNameViewController.result = result
        case "EditDate":
            guard let editDateViewController = segue.destination as? EditDateViewController
                else {
                    fatalError("Uexpected destination: \(segue.destination)")
            }
            
            editDateViewController.result = THISresult
        case "EditAuflage":
            guard let editAuflageViewController = segue.destination as? EditAuflageViewController
                else {
                    fatalError("Uexpected destination: \(segue.destination)")
            }
            
            editAuflageViewController.result = THISresult
        case "EditResult":
            guard let resultPageViewController = segue.destination as? ResultPageViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            let currentResult = THISresult
            resultPageViewController.result = currentResult
 
        case "Gesamtergebnis":
            guard let gesamtergebnisTableViewController = segue.destination as? GesamtergebnisTableViewController else {
                fatalError("Uexpected destination: \(segue.destination)")
            }
            gesamtergebnisTableViewController.result = THISresult
            print("Gesamtergebnis Segue executed.")
            
        case "AddSchuetze":
            guard let addSchuetzeTableViewController = segue.destination as? AddSchuetzeViewController else {
                fatalError("Uexpected destination: \(segue.destination)")
            }
            addSchuetzeTableViewController.result = THISresult
        default:
            // Configure the destination view controller only when the save button is pressed.
            guard let button = sender as? UIBarButtonItem, button === saveButton else {
                os_log("The save button was not pressed, cancelling.", log: OSLog.default, type: .debug)
                return
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            
            
            let name = nameLabel.text
            let auflage = THISresult?.auflage
            let photo = UIImage(named: "defaultPhoto")
            let date = dateFormatter.date(from: dateLabel.text!)
            
            let round1_result = THISresult?.round1_result
            let round2_result = THISresult?.round2_result
            let round3_result = THISresult?.round3_result
            let round4_result = THISresult?.round4_result
            let round5_result = THISresult?.round5_result
            let round6_result = THISresult?.round6_result
            
            // Set the result to be passed to Result TableViewController after the unwind segue.
            THISresult = Result(name: name!, date: date!, auflage: auflage!, round1_result: round1_result!, round1_image: photo, round2_result: round2_result!, round2_image: photo, round3_result: round3_result!, round3_image: photo, round4_result: round4_result!, round4_image: photo, round5_result: round5_result!, round5_image: photo, round6_result: round6_result!, round6_image: photo) //TODO: Hardcoded
        }
        
    }
    
    
    //MARK: Actions
    
    
    @IBAction func unwindToResultList(sender: UIStoryboardSegue) {
        print("unwindtoeresultlist called.")
        print(sender.source)
        if let sourceViewController = sender.source as? EditNameViewController, let result = sourceViewController.result {
            
            print("Name was changed.")
            
            THISresult = result
            
            nameLabel.text = THISresult?.name
        }
        if let sourceViewController = sender.source as? EditDateViewController, let result = sourceViewController.result {
            
            print("Date was changed.")
            
            THISresult = result
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd.MM.yyyy"
            
            dateLabel.text = dateformatter.string(from: THISresult!.date)
        }
        if let sourceViewController = sender.source as? EditAuflageViewController, let result = sourceViewController.result {
            
            print("Auflage was changed.")
            
            THISresult = result
            
            auflageLabel.text = THISresult!.auflage.name
        }
    }
    
    @IBAction func shareButton(_ sender: Any) {
    
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textToShare = "Check out my app"
        
        if let myWebsite = URL(string: "http://itunes.apple.com/app/idXXXXXXXXX") {//Enter link to your app here
            let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop,
                                                UIActivity.ActivityType.addToReadingList,
                                                UIActivity.ActivityType.assignToContact,
                                                UIActivity.ActivityType.copyToPasteboard,
                                                UIActivity.ActivityType.openInIBooks,
                                                UIActivity.ActivityType.postToFlickr,
                                                UIActivity.ActivityType.postToTencentWeibo,
                                                UIActivity.ActivityType.postToVimeo,
                                                UIActivity.ActivityType.postToWeibo,
                                                UIActivity.ActivityType.saveToCameraRoll]
            //
            
            self.present(activityVC, animated: true, completion: nil)
        }
        
    }
    
}
