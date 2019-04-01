//
//  TrackingPage4ViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 06.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit

class TrackingPage4ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var result: Result?
    
    @IBOutlet weak var page4Image: UIImageView!
    @IBOutlet weak var page4Result: UILabel!
    @IBOutlet weak var page4AddedResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        page4Result.text = "Rundenergebnis: 0"
        page4AddedResult.text = "Zwischenergebnis: 145"
        
        /*
        result = (self.parent as! ResultPageViewController).result
        
        let addedResult = (result?.round1_result ?? 0) + (result?.round2_result ?? 0)
        
        let addedResult1 = addedResult + (result?.round3_result ?? 0) + (result?.round4_result ?? 0)
        
        page4Image.image = result?.round4_image
        page4Result.text = "Rundenergebnis: " + String(result?.round4_result ?? 0)
        page4AddedResult.text = "Rundenergebnis: " + String(addedResult1)
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
            page4Image.contentMode = .scaleToFill
            page4Image.image = pickedImage
            
            page4Result.text = "Rundenergebnis: 50"
            page4AddedResult.text = "Zwischenergebnis: 195"
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
