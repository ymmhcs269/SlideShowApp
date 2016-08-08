//
//  EnlargeViewController.swift
//  SlideshowApp
//
//  Created by 佐藤まりの on H28/08/04.
//  Copyright © 平成28年 mycompany. All rights reserved.
//

import UIKit

class EnlargeViewController: UIViewController {
    
    
    @IBOutlet weak var bigphoto: UIImageView!

    var image:UIImage? = nil
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bigphoto.image = image
        /*　改善カ所（画像を前よりも自然体の大きさで表示）　*/
        bigphoto.contentMode = UIViewContentMode.ScaleAspectFill
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*/Users/satoumarino/Desktop/animalimage/alpaca.jpg
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}