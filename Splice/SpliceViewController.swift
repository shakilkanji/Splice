//
//  SpliceViewController.swift
//  Splice
//
//  Created by Shakil Kanji on 2016-11-03.
//  Copyright © 2016 Shakil Kanji. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
import AVKit
import MobileCoreServices
import Photos


class SpliceViewController: UIViewController {
    
    var sourceURL: NSURL?
    var startTime: CMTime = CMTimeMake(0, 1)
    var endTime: CMTime = CMTimeMake(10, 1)

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
        let asset = AVURLAsset(url: sourceURL as! URL)
        let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPreset640x480)
        let exportPath: String = NSTemporaryDirectory().appending("/videos.mov")
        let outputVideoURL: URL = NSURL.fileURL(withPath: exportPath)
        
        exportSession?.outputURL = outputVideoURL
        exportSession?.shouldOptimizeForNetworkUse = true
        exportSession?.outputFileType = AVFileTypeQuickTimeMovie
        
        _ = try? FileManager().removeItem(at: outputVideoURL)
        
        let range = CMTimeRangeMake(startTime, endTime)
        exportSession?.timeRange = range
        
        exportSession?.exportAsynchronously(completionHandler: {
            if (exportSession?.status == .completed) {
                PHPhotoLibrary.shared().performChanges({ 
                    PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: outputVideoURL)
                }, completionHandler: { (saved, error) in
                    if saved {
                        let alert = UIAlertController(title: "Wow", message: "You have saved a video!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: false, completion: nil)
                    }
                })
                print("Done")
            } else if (exportSession?.status == .failed) {
                print("failed")
            } else if (exportSession?.status == .cancelled) {
                print("cancelled")
            } else {
                print("other")
            }
        })

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
