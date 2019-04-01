//
//  TrackingPage3ViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 06.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit

class TrackingPage3ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var result: Result?
    
    @IBOutlet weak var page3Image: UIImageView!
    @IBOutlet weak var page3Result: UILabel!
    @IBOutlet weak var page3AddedResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        page3Result.text = "Rundenergebnis: 0"
        page3AddedResult.text = "Zwischenergebnis: 99"
        
        /*
        result = (self.parent as! ResultPageViewController).result

        let addedResult = (result?.round1_result ?? 0) + (result?.round2_result ?? 0) + (result?.round3_result ?? 0)
        
        page3Image.image = result?.round3_image
        page3Result.text = "Rundenergebnis: " + String(result?.round3_result ?? 0)
        page3AddedResult.text = "Rundenergebnis: " + String(addedResult)
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
            page3Image.contentMode = .scaleToFill
            page3Image.image = pickedImage
            
            page3Result.text = "Rundenergebnis: 46"
            page3AddedResult.text = "Zwischenergebnis: 145"
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
