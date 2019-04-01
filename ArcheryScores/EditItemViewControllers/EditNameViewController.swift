//
//  EditNameViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 28.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//


import UIKit
import os.log

class EditNameViewController: UIViewController, UITextFieldDelegate {
    
    var result: Result?
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        if let result = result {
        nameTextField.text = result.name
        }
        
        updateBackButtonState()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
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
        
        print("EditNameViewController saved result back to ResultSetupTableViewController.")
        super.prepare(for: segue, sender: sender)
        
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === backButton else {
            os_log("The back button was not pressed, cancelling.", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        
        result?.name = name
    }
 
    
    //MARK: Private Methods
    
    private func updateBackButtonState() {
        // Disable the button, if the text field is empty.
        let text = nameTextField.text ?? ""
        backButton.isEnabled = !text.isEmpty
    }

}
