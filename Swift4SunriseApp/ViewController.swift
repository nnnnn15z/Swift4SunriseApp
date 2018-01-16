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
        
    }
    
}

