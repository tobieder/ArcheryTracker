//
//  SettingsTableViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 31.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var THISsettings: Settings?
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var trainerModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = THISsettings!.email
        passwordLabel.text = THISsettings!.passwort
        trainerModeSwitch.isOn = THISsettings!.trainerMode
        
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        switch (segue.identifier ?? "") {
            case "EditEMail":
                guard let editEMailViewController = segue.destination as?    EditEMailViewController else {
                        fatalError("Uexpected destination: \(segue.destination)")
                }
        
                editEMailViewController.settings = THISsettings
        case "EditPassword":
            guard let editPasswordViewController = segue.destination as?    EditPasswordViewController else {
                fatalError("Uexpected destination: \(segue.destination)")
            }
            
            editPasswordViewController.settings = THISsettings
        case "AddSchuetze":
            guard let addSchuetzeViewController = segue.destination as?    AddSchuetzeSettingViewController else {
                fatalError("Uexpected destination: \(segue.destination)")
            }
            
            addSchuetzeViewController.settings = THISsettings
        case "ShowSchuetzen":
            guard let showSchuetzeViewController = segue.destination as?    ShowSchuetzenTableViewController else {
                fatalError("Uexpected destination: \(segue.destination)")
            }
            
            showSchuetzeViewController.settings = THISsettings
        default:
            print("Nothing really happened.")
        }
        
        let email = emailLabel.text
        let passwort = passwordLabel.text
        let trainerMode = trainerModeSwitch.isOn
        
        THISsettings = Settings(email: email!, passwort: passwort!, trainerMode: trainerMode)
    }
    
    //MARK: Actions
    
    
    @IBAction func unwindToResultList(sender: UIStoryboardSegue) {
        print("unwindtoeresultlist called.")
        print(sender.source)
        if let sourceViewController = sender.source as? EditEMailViewController, let settings = sourceViewController.settings {
            
            print("EMail was changed.")
            
            THISsettings = settings
            
            emailLabel.text = THISsettings?.email
        }
        if let sourceViewController = sender.source as? EditPasswordViewController, let settings = sourceViewController.settings {
            
            print ("Password was changed.")
            
            THISsettings = settings
            
            passwordLabel.text = settings.passwort
        }
    }

}
