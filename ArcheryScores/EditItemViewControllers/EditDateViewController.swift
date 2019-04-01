//
//  EditDateViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 28.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class EditDateViewController: UIViewController {
    
    var result: Result?

    @IBOutlet weak var dateDatePicker: UIDatePicker!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let result = result{
        dateDatePicker.date = result.date
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
        
        let date = dateDatePicker.date
        
        result?.date = date
    }

}
