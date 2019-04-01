//
//  AddSchuetzeSettingViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 15.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class AddSchuetzeSettingViewController: UIViewController, UITextFieldDelegate {
    
    
    var settings: Settings?
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        
        updateBackButtonState()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        backButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateBackButtonState()
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
        
        let email = emailTextField.text ?? ""
        
        /*if(settings?.schuetzen[0] == "Keine Schützen eingetragen.") {
            settings?.schuetzen.remove(at: 0)
        }*/
        
        settings?.schuetzen.append(email)
        
        print(settings?.schuetzen)
    }
    
    
    //MARK: Private Methods
    
    private func updateBackButtonState() {
        // Disable the button, if the text field is empty.
        let text = emailTextField.text ?? ""
        backButton.isEnabled = !text.isEmpty
    }
    
}
