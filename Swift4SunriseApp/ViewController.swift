//
//  ViewController.swift
//  Swift4SunriseApp
//
//  Created by ryo.takahashi on 2018/01/16.
//  Copyright © 2018年 ryo.takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var _cityNameInput: UITextField!
    
    @IBOutlet weak var _sunriseTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func findSunrise(_ sender: Any) {
        // CityNameを取得
        let cityName:String = _cityNameInput.text!
        // API通信
        // URLを作成
        let url:URL = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22\(cityName)%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")!
        
        // リクエストを作成
        let request:NSURLRequest = NSURLRequest(url: url)
        
        // リクエストを投げる
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) { (response, data, error) in
            // 受け取ったデータのnil判定
            
            if let _data = data {
                // 帰ってきたデータに文字列を変換
                let getData: NSString = NSString(data: _data, encoding: String.Encoding.utf8.rawValue)!
                print(getData)
                
                do{
                    // JSONをパースする
                    let json: NSDictionary = try JSONSerialization.jsonObject(with: _data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    //["results"]["channel"]["astronomy"]["sunrise"])
                    let query: NSDictionary = json["query"] as! NSDictionary
                    let results: NSDictionary = query["results"] as! NSDictionary
                    let channel: NSDictionary = results["channel"] as! NSDictionary
                    let astronomy: NSDictionary = channel["astronomy"] as! NSDictionary
                    let sunrise: NSString = astronomy["sunrise"] as! NSString
                    
                    print(sunrise)
                    
                    // メインスレッドでUI更新する　（バックグラウンドではできない）
                    DispatchQueue.main.async {
                        self._sunriseTimeLabel.text = "日の出時刻：\(sunrise)"
                    }
                    
                }catch{
                    
                }
            }
        }
        
    
        
    }
    
    
    
}

