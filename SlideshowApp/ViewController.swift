//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ayano-s on 2020/08/04.
//  Copyright © 2020 ayano-s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //画像の配列
    var imageArray:[UIImage] = [UIImage(named: "animal1.jpg")!,UIImage(named: "animal2.jpg")!,UIImage(named: "animal3.jpg")!]
    
    //画像配列用の番号
    var imageIndex:Int = 0
    
    //ボタン配列用の変数
    var buttonIndex: Int = 0
    
    //タイマー
    var timer: Timer!
    
    //タイマー用の変数
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imageArray[imageIndex]
    }
    
    @IBAction func play(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage(_:)), userInfo: nil, repeats: true)
            playButton.setTitle("停止", for: .normal)
            backButton.isEnabled = false
            nextButton.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer_sec = 0
            self.timer = nil
            playButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }
    
    @IBAction func back(_ sender: Any) {
        //画像が最初まできた時
        if imageIndex == 0 {
            imageIndex = 2
        //それ以外
        } else {
            imageIndex -= 1
        }
        imageView.image = imageArray[imageIndex]
    }
    
    @IBAction func next(_ sender: Any) {
        //画像が最後まできた時
        if imageIndex == imageArray.count - 1 {
            imageIndex = 0
        //それ以外
        } else {
            imageIndex += 1
        }
        imageView.image = imageArray[imageIndex]
    }
    
    @objc func changeImage(_ timer: Timer) {
        self.timer_sec += 2.0
        if imageIndex == imageArray.count - 1 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = imageArray[imageIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のExpansionViewControllerを取得する
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        
        // 遷移先のExpansionViewControllerで宣言している変数に値を代入して渡す
        expansionViewController.image = imageArray[imageIndex]

        //スライドショーが動いている時は止める
        if timer != nil {
            self.timer.invalidate()
            self.timer_sec = 0
            self.timer = nil
            playButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

