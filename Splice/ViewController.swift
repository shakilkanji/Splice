//
//  ViewController.swift
//  Splice
//
//  Created by Shakil Kanji on 2016-11-01.
//  Copyright © 2016 Shakil Kanji. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var videoPath: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: IBActions
    
    @IBAction func didPressOpenCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
 
    @IBAction func didPressOpenPhotoLibrary(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

    @IBAction func didPressSaveButton(_ sender: Any) {
        self.performSegue(withIdentifier: "showSpliceVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSpliceVC" {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! SpliceViewController
            vc.sourceURL = videoPath
        }
    }
    
    // MARK: UIImagePickerController Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == (kUTTypeMovie as String) {
            let videoURL = info[UIImagePickerControllerMediaURL] as! NSURL
            self.videoPath = videoURL
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

