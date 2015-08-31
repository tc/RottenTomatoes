//
//  SecondViewController.swift
//  RottenTomatoes
//
//  Created by Tommy Chheng on 8/26/15.
//  Copyright (c) 2015 Tommy Chheng. All rights reserved.
//

import UIKit

// Top DVD View
class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let tumblrHUD = AMTumblrHud(frame: CGRectMake(100, 100, 55, 20))
        self.view.addSubview(tumblrHUD)
        tumblrHUD.showAnimated(true)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

