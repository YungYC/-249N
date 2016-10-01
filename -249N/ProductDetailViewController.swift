//
//  ProductDetailViewController.swift
//  -249N
//
//  Created by Duncan on 2016/7/8.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var productImageStr:String = ""

    @IBOutlet weak var productImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard productImageStr != "" else {return print("NULL ERROR")}
        productImage.image = UIImage(named: productImageStr)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
