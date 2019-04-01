//
//  TrackingPage2ViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 06.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit

class TrackingPage2ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var result: Result?
    
    @IBOutlet weak var page2Image: UIImageView!
    @IBOutlet weak var page2Result: UILabel!
    @IBOutlet weak var page2AddedResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        page2Result.text = "Rundenergebnis: 0"
        page2AddedResult.text = "Zwischenergebnis: 48"
        
        
        /*
        result = (self.parent as! ResultPageViewController).result
        
            
            page2Image.image = result?.round2_image
        page2Result.text = "Rundenergebnis: " + String(result?.round2_result ?? 0)
        page2AddedResult.text = "Rundenergebnis: " + String((result?.round1_result ?? 0) + (result?.round2_result ?? 0) )
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
            page2Image.contentMode = .scaleToFill
            page2Image.image = pickedImage
            
            page2Result.text = "Rundenergebnis: 51"
            page2AddedResult.text = "Zwischenergebnis: 99"
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
