//
//  FirstViewController.swift
//  -249N
//
//  Created by Duncan on 2016/7/2.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var newsArr: [AnyObject]?
    var newsTitleArr: [String]? = []
    var newsTimeArr: [String]? = []
    var newsContentArr: [String]? = []

    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myIndicator.startAnimating()
        
        print("Time:" + "\(YUNGtimeOfTaipei())")
        
        DataRef.child("公告").observeSingleEventOfType(.Value, withBlock: { (FIRDataSnapshot) in
            //print(FIRDataSnapshot)
            self.newsArr = FIRDataSnapshot.value as? [AnyObject]
            //print(self.newsArr)
            
            for news in self.newsArr!{
                
                let newsDic = news as! [String: String]
                self.newsTitleArr?.append(newsDic["title"]!)
                self.newsTimeArr?.append(newsDic["time"]!)
                self.newsContentArr?.append(newsDic["content"]!)
                
                self.newsTableView.reloadData()
                self.myIndicator.stopAnimating()
                //print(self.newsTitleArr)
                
            }
        })
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if newsTitleArr! != [] {
            return newsTitleArr!.count
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let titleLabel = cell.contentView.subviews[0] as! UILabel
        let dateLabel = cell.contentView.subviews[1] as! UILabel

        if newsTitleArr! != [] {
            titleLabel.text = newsTitleArr![indexPath.row]
            dateLabel.text = newsTimeArr![indexPath.row]
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        newsTableView.deselectRowAtIndexPath(indexPath, animated: false)
        performSegueWithIdentifier("showDetail", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! DetailViewController
        let titleLabel = vc.view.subviews[0] as! UILabel
        titleLabel.text = newsTitleArr![sender as! Int]
        let contentLabel = vc.view.subviews[1] as! UILabel
        contentLabel.text = newsContentArr![sender as! Int]
    }
}













