//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Makoto Kaneko on 2018/10/09.
//  Copyright © 2018年 Makoto Kaneko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var imagebutton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func imagebutton(_ sender: Any) {
    }
    
    @IBAction func behind(_ sender: Any) {
        //スライド動作（＋）
        dispImageNO += 1
        displayImage()
    }
    
    @IBAction func Forward(_ sender: Any) {
        //スライド動作（−）
        dispImageNO -= 1
        displayImage()
    }
    
    @IBAction func auto(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer (timeInterval: 2.0, target: self, selector : #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            start.setTitle("停止",for: .normal)
            susumu.isEnabled = false
            modoru.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            start.setTitle("再生",for: .normal)
            susumu.isEnabled = true
            modoru.isEnabled = true
        }
    }
    
    
    var timer : Timer!
    
    //表示している画像の番号
    var dispImageNO = 0
    let imageNameArray = ["AIRDO.jpg","ANA.jpg","JAL.jpg","SFJ.jpeg","SNJ.jpg",]
    
    //表示している画像の番号を元に画像を表示する
    func displayImage(){
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNO < 0{
            dispImageNO = 4
        }
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNO > 4{
            dispImageNO = 0
        }
        //表示している画像の番号から名前を取り出し
        //画像の読み込み
        //Imageviewに読み込んだ画像をセット
        let name=imageNameArray[dispImageNO]
        let image = UIImage(named: name)
        imageView.image = image
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named : "AIRDO.jpg")
        imageView.image = image
    }
    
    //imaerによって一定の間隔で呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 関数が呼ばれていることを確認
        print("onTimer")
        //表示している画像の番号を1増やす
        dispImageNO += 1
        //表示している画像の番を元に画像を表示
        displayImage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //segueの設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer !== nil{
            self.timer.invalidate()
            let secondviewController :secondviewController = segue.destination as! secondviewController
            secondviewController.selectphoto = UIImage(named:imageNameArray[dispImageNO])
        }else{
        let secondviewController :secondviewController = segue.destination as! secondviewController
        secondviewController.selectphoto = UIImage(named:imageNameArray[dispImageNO])
        }
        
    }
    //戻り
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
                start.setTitle("再生",for: .normal)
                susumu.isEnabled = true
                modoru.isEnabled = true
        
        
        }
        
    
}



