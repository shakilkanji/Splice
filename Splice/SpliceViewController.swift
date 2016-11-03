//
//  SpliceViewController.swift
//  Splice
//
//  Created by Shakil Kanji on 2016-11-03.
//  Copyright © 2016 Shakil Kanji. All rights reserved.
//

import UIKit
import AVFoundation
import AssetsLibrary
import CoreMedia
import MediaPlayer
import MobileCoreServices

class SpliceViewController: UIViewController {
    
    var sourceURL: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    
    @IBAction func didPressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressSave(_ sender: Any) {

        
        let alert = UIAlertController(title: "Wow", message: "You have saved a video!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: false, completion: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
