//
//  ViewController.swift
//  finalImagePicker
//
//  Created by Saddam Hossain on 18/7/18.
//  Copyright © 2018 Saddam Hossain. All rights reserved.
//

import UIKit
import ImagePicker
import Lightbox

class ViewController: UIViewController,ImagePickerDelegate {
    
   
    
    @IBAction func clickPicker(_ sender: Any) {
        
        var setting = Configuration()
        setting.doneButtonTitle = "exit"
        setting.noImagesTitle = "Sorry! There are no images here!"
        setting.recordLocation = true
        setting.allowVideoSelection = true
        
        let myPicker = ImagePickerController(configuration: setting)
        myPicker.delegate = self
        
        present(myPicker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
        let lightboxImages = images.map {
            return LightboxImage(image: $0)
        }
        
        let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
        imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true, completion: nil)

    }
    
    
    
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)

        
    }

}

