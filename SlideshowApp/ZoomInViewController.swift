//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by 小山燈実 on 2020/08/05.
//  Copyright © 2020 tomomi.koyama. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController {
   
    @IBOutlet weak var imageView: UIImageView!
          var selectedImg: UIImage!
          var Image = UIImage()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = selectedImg
    }
    
    @IBAction func backBtn(_ sender: Any) {
          dismiss(animated: true, completion: nil)
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
