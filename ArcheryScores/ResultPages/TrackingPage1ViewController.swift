//
//  TrackingPage1ViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 19.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit

class TrackingPage1ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var result: Result?
    
    @IBOutlet weak var page1Image: UIImageView!
    @IBOutlet weak var page1Result: UILabel!
    @IBOutlet weak var page1AddedResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //result = (self.parent as! ResultPageViewController).result
        
        page1Result.text = "Rundenergebnis: 0"
        page1AddedResult.text = "Zwischenergebnis: 0"
        
        /*
        page1Image.image = result?.round1_image
        page1Result.text = "Rundenergebnis: " + String(result?.round1_result ?? 0)
        page1AddedResult.text = "Rundenergebnis: " + String(result?.round1_result ?? 0)
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
            page1Image.contentMode = .scaleToFill
            page1Image.image = pickedImage
            
            //result?.round3_image = page1Image.image
            
            page1Result.text = "Rundenergebnis: 48"
            page1AddedResult.text = "Zwischenergebnis: 48"
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
