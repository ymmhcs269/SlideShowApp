//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐藤まりの on H28/08/04.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    //メソッドとプロパティの設定
   
    @IBOutlet weak var imagephoto: UIImageView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var startstop: UIButton!
    @IBOutlet weak var precede: UIButton!

    
    //一時的に写真の保存
    let photos = [UIImage(named:"alpaca.jpg"),UIImage(named:"bear.jpg"), UIImage(named:"rabbit.jpg"), UIImage(named:"koala.jpg"), UIImage(named:"giraffe.jpg")]
    
    //変数の宣言
    var timer:NSTimer = NSTimer()
    var count = 0
    
    
    
    //進む機能の設定
    @IBAction func precede(sender: AnyObject) {
        
        count += 1
        if count == 5 {
            count = 0

        }
        imagephoto.image = photos[count]
        
    }
    
    //戻る機能の設定
    @IBAction func back(sender: AnyObject) {
        
        count -= 1
        if count == -1{
            count = 4
        }
        imagephoto.image = photos[count]
        

    }
    
    //ボタンの再生と一時停止の機能の設定
    @IBAction func startstop(sender: AnyObject){
        
        //タイマーの設定
        if !timer.valid{
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0,
                                                        target: self,
                                                        selector: #selector(ViewController.result),
                                                        userInfo: nil,
                                                        repeats: true)
            
            // タイマーが動いている時：進むボタンと戻るボタンを使えないようにする
            precede.hidden = true
            back.hidden = true
            
            startstop.setTitle("■", forState: UIControlState.Normal)
        }else {
                
                //タイマーが動いていない時：進むボタンと戻るボタンを使えるようにする
                timer.invalidate()
                
                precede.hidden = false
                back.hidden = false
                
                startstop.setTitle("▶︎", forState: UIControlState.Normal)


            
        }
    }
    
    func result() {
    count += 1
        if count == 5 {
            count = 0
        }
        imagephoto.image = photos[count]
        
           }
    
    //画面の遷移
    @IBAction func imagephoto(sender: AnyObject) {
    }

    
    

    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

            }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // タップイベント.
    func tapped(sender: UITapGestureRecognizer){
        
        // ViewController2 へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("toEnlargeViewController",sender: nil)
        print(sender)
    }

    
    //enlargeControllerViewの内容
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let enlargeViewController:EnlargeViewController = segue.destinationViewController as! EnlargeViewController
        
        enlargeViewController.image = photos[count]

    }
    
        //遷移先から遷移元へ戻る
        @IBAction func unwind(segue: UIStoryboardSegue){
    }
    
}

