//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小山燈実 on 2020/08/05.
//  Copyright © 2020 tomomi.koyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
      var timer : Timer!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
          let image = UIImage(named: "Photo1")
                imageView.image = image
        
        imageView.isUserInteractionEnabled = true
                
    }

    
    var displayImageNo = 0
    let imageNameArray = ["Photo1", "Photo2", "Photo3",]
    
    func displayImage() {
        
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        
        imageView.image = image
        
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
          
          if displayImageNo < imageNameArray.count - 1 {
              displayImageNo += 1
              displayImage()
          } else {
              displayImageNo = 0
              displayImage()
          }
    }
      
    @IBAction func switchButtonTap(_ sender: Any) {
           if self.timer == nil {
               
               self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
               
               nextButton.isEnabled = false
               backButton.isEnabled = false
               
               switchButton.setTitle("停止", for: .normal)
               
               
           } else if self.timer != nil {
               self.timer.invalidate()
               self.timer = nil
               
               nextButton.isEnabled = true
               backButton.isEnabled = true
               
               switchButton.setTitle("再生", for: .normal)
               
           }
       }
       
       
       @objc func updateTimer(_ timer: Timer) {
           
           if displayImageNo < imageNameArray.count - 1 {
               displayImageNo += 1
               displayImage()
               print(displayImageNo)
           } else {
               displayImageNo = 0
               displayImage()
               print(displayImageNo)
           }
       }
       
    
    
    @IBAction func backButtonTap(_ sender: Any) {
       if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
            displayImageNo -= 1
            displayImage()
       } else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
              }
        
    }

    
    @IBAction func onTapAction(_ sender: Any) {
        
        if self.timer != nil {
                 print("タイマー停止")
                 
                 backButton.isEnabled = true
                 nextButton.isEnabled = true
                 timer.invalidate()
            self.timer = nil
            
        }
        
          self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             print("coll")
        
        
            let zoomInViewController:ZoomInViewController = segue.destination as! ZoomInViewController
            
            let name = imageNameArray[displayImageNo]
            let image = UIImage(named: name)
            
            zoomInViewController.selectedImg = image
        }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       }
    
}

