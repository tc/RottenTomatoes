//
//  FirstViewController.swift
//  RottenTomatoes
//
//  Created by Tommy Chheng on 8/26/15.
//  Copyright (c) 2015 Tommy Chheng. All rights reserved.
//

import UIKit

//Movie Detail
class MovieDetailViewController: UIViewController {
    var movie:NSDictionary?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let m = movie {
            let title = m.valueForKeyPath("title") as? String
            let imageUrl = RottenTomatoesApi.correctHighResImageUrl(m.valueForKeyPath("posters.detailed") as! String)
            
            titleLabel.text = title
            posterImageView.setImageWithURL(NSURL(string:imageUrl)!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
