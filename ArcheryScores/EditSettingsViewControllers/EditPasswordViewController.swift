//
//  EditPasswordViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 31.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit
import os.log

class EditPasswordViewController: UIViewController, UITextFieldDelegate {
    
    
    var settings: Settings?
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.delegate = self
        
        if let settings = settings {
            passwordTextField.text = settings.passwort
        }
        
        updateBackButtonState()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        passwordTextField.becomeFirstResponder()
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
        
        let password = passwordTextField.text ?? ""
        
        settings?.passwort = password
    }
    
    
    //MARK: Private Methods
    
    private func updateBackButtonState() {
        // Disable the button, if the text field is empty.
        let text = passwordTextField.text ?? ""
        backButton.isEnabled = !text.isEmpty
    }

}
