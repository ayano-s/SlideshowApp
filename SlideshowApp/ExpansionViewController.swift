//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 齋藤　綾乃 on 2020/08/04.
//  Copyright © 2020 ayano-s. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    //画像を受け取るプロパティの宣言
    var image:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = image
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
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
