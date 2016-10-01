//
//  StoryViewController.swift
//  -249N
//
//  Created by Duncan on 2016/7/8.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit
import SafariServices

class StoryViewController: UIViewController, SFSafariViewControllerDelegate {
    

    @IBAction func facebookBtn(sender: UIButton) {
        hyperlink("https://www.facebook.com/" + chineseToNSURL("北緯249度-雞蛋糕") + "-1090514414333763/?ref=br_rs")
    }
    
    @IBAction func greetStudioLink(sender: UIButton) {
    
        hyperlink("https://www.facebook.com/" + chineseToNSURL("北緯249度-雞蛋糕") + "-1090514414333763/?ref=br_rs")
    }
    @IBAction func yungsLink(sender: UIButton) {
    
        hyperlink("http://yungs.pancakeapps.com")
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //let safariVC = SFSafariViewController(URL: NSURL(string: link!)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func hyperlink(link: String) {
        let safariVC = SFSafariViewController(URL: NSURL(string: link)!, entersReaderIfAvailable: true)
        safariVC.delegate = self
        self.presentViewController(safariVC, animated: true, completion: nil)
    }
    
    func chineseToNSURL(word: String) -> String {
    
        return word.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!

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
