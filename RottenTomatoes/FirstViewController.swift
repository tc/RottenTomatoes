//
//  FirstViewController.swift
//  RottenTomatoes
//
//  Created by Tommy Chheng on 8/26/15.
//  Copyright (c) 2015 Tommy Chheng. All rights reserved.
//

import UIKit

//Box Office View
class FirstViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var refreshControl:UIRefreshControl?
    
    let rottenTomatoes = RottenTomatoesApi()
    var movies:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: "updateData", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.insertSubview(self.refreshControl!, atIndex:0)
        
        updateData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK - Data
    func updateData() {
        rottenTomatoes.getBoxOffice({(movies:NSArray) in
            self.movies = movies
            
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        })
    }
    
    //MARK - Table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("movieCell") as! UITableViewCell
        
        let movie = self.movies[indexPath.row] as! NSDictionary
        
        let title = movie.valueForKeyPath("title") as? String
        let imageUrl = movie.valueForKeyPath("posters.thumbnail") as! String
        
        cell.textLabel?.text = title
        cell.imageView?.setImageWithURL(NSURL(string:imageUrl)!)
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }

    //Mark - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationView = segue.destinationViewController as! MovieDetailViewController
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
        
        let movie = movies[indexPath.row] as! NSDictionary
        
        destinationView.movie = movie
    }
}

