//
//  TrackingPage6ViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 06.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit

class TrackingPage6ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var result: Result?
    
    @IBOutlet weak var page6Image: UIImageView!
    @IBOutlet weak var page6Result: UILabel!
    @IBOutlet weak var page6AddedResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        page6Result.text = "Rundenergebnis: 0"
        page6AddedResult.text = "Zwischenergebnis: 247"
        
        /*
        result = (self.parent as! ResultPageViewController).result
        
        let addedResult = (result?.round1_result ?? 0) + (result?.round2_result ?? 0) + (result?.round3_result ?? 0)
        
        let addedResult1 = addedResult + (result?.round4_result ?? 0) + (result?.round5_result ?? 0)
        
        page6Image.image = result?.round6_image
        page6Result.text = "Rundenergebnis: " + String(result?.round6_result ?? 0)
        page6AddedResult.text = "Rundenergebnis: " + String(addedResult1 + (result?.round6_result ?? 0))
 */
        
    }
    
    
    //MARK: Actions
    
    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            page6Image.contentMode = .scaleToFill
            page6Image.image = pickedImage
            
            page6Result.text = "Rundenergebnis: 51"
            page6AddedResult.text = "Endergebnis: 298"
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
