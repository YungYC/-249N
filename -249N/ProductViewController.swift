//
//  ProductViewController.swift
//  -249N
//
//  Created by Duncan on 2016/7/8.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var productlistArr = ["袋裝雞蛋糕", "禮盒雞蛋糕", "即將推出"]
    var productImageArr = ["001", "002", "003"]
    var descriptionArr = [
    "免預定，來攤即可購買的經典紙袋包裝雞蛋糕，讓您享用美味無最輕鬆！",
    "特色創意化商品雞蛋糕禮盒，送禮精緻大方，歡迎預訂",
    "即將推出，敬請期待！"
    ]
    
    @IBOutlet weak var productTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataRef.child("商品").child("list").observeSingleEventOfType(.Value, withBlock: {(snapshot) in
            self.productlistArr = snapshot.value as! [String]
            self.productTable.reloadData()
            
        })
        let n = productlistArr.count - 1
        for index in 0 ... n {
            let productname = productlistArr[index]
            DataRef.child("商品").child(productname).child("description").observeSingleEventOfType(.Value, withBlock: {(snapshot2) in
                //print(snapshot2)
                guard snapshot2.value != nil else {return print("NULL ERROR")}
                self.descriptionArr[index] = snapshot2.value as! String
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productlistArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath)
        let backgroundImage = cell.contentView.subviews[0] as! UIImageView
        let titleLabel = cell.contentView.subviews[1] as! UILabel
        //let dateLabel = cell.contentView.subviews[1] as! UILabel
        
        backgroundImage.image = UIImage(named: productImageArr[indexPath.row])
        if productlistArr != [""] {
            titleLabel.text = productlistArr[indexPath.row]
            //dateLabel.text = productlistArr[indexPath.row]
        }
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetail", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! ProductDetailViewController
        vc.productImageStr = productImageArr[sender as! Int]
        
        //let bigImage = vc.view.subviews[0] as! UIImageView
        let productName = vc.view.subviews[1] as! UILabel
        let description = vc.view.subviews[2] as! UILabel
        
        //bigImage.image = UIImage(named: productImageArr[sender as! Int])
        productName.text = productlistArr[sender as! Int]
        description.text = descriptionArr[sender as! Int]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
