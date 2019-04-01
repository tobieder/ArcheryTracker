//
//  TrackingPage5ViewController.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 06.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit

class TrackingPage5ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var result: Result?
    
    @IBOutlet weak var page5Image: UIImageView!
    @IBOutlet weak var page5Result: UILabel!
    @IBOutlet weak var page5AddedResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        page5Result.text = "Rundenergebnis: 0"
        page5AddedResult.text = "Zwischenergebnis: 195"
        
        /*
        result = (self.parent as! ResultPageViewController).result
        
        let addedResult = (result?.round1_result ?? 0) + (result?.round2_result ?? 0) + (result?.round3_result ?? 0)
        
        let addedResult1 = addedResult + (result?.round4_result ?? 0) + (result?.round5_result ?? 0)
        
        page5Image.image = result?.round5_image
        page5Result.text = "Rundenergebnis: " + String(result?.round5_result ?? 0)
        page5AddedResult.text = "Rundenergebnis: " + String(addedResult1)
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
            page5Image.contentMode = .scaleToFill
            page5Image.image = pickedImage
            
            page5Result.text = "Rundenergebnis: 52"
            page5AddedResult.text = "Zwischenergebnis: 247"
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
