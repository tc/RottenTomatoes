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
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        
        if let m = movie {
            let title = m.valueForKeyPath("title") as! String
            let year = m.valueForKeyPath("year") as! Int
            let synopsis = m.valueForKeyPath("synopsis") as? String
            let imageUrl = RottenTomatoesApi.correctHighResImageUrl(m.valueForKeyPath("posters.detailed") as! String)
            
            self.title = title
            
            titleLabel.text = "\(title) \(year)"
            posterImageView.setImageWithURL(NSURL(string:imageUrl)!)
            descriptionTextView.text = synopsis
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
