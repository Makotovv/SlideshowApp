//
//  secondviewController.swift
//  SlideshowApp
//
//  Created by Makoto Kaneko on 2018/10/09.
//  Copyright © 2018年 Makoto Kaneko. All rights reserved.
//

import UIKit

class secondviewController: UIViewController {

    @IBOutlet weak var Lphoto: UIImageView!
    
    var selectphoto : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        Lphoto.image = selectphoto
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
