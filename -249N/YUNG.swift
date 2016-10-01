//
//  YUNG.swift
//  FirebaseDemo
//
//  Created by Duncan on 2016/6/27.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import Foundation
import UIKit
import SafariServices


extension UIViewController{
    
    //Alert
    func isSupport() -> Bool {
        return NSClassFromString("UIAlertController") != nil
    }
    func YUNGalert(message: String!) {
        if isSupport() {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
}

extension UIViewController{
    func YUNGhyperlink(link: String, view: UIViewController) {
        let safariVC = SFSafariViewController(URL: NSURL(string: link)!, entersReaderIfAvailable: true)
        //safariVC.delegate = view
        view.presentViewController(safariVC, animated: true, completion: nil)
    }
}

/**
 Executes the closure on the main queue after a set amount of seconds.
 
 - parameter delay:   Delay in seconds
 - parameter closure: Code to execute after delay
 */


func delayOnMainQueue(delay: Double, closure: ()->()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

/**
 Executes the closure on a background queue after a set amount of seconds.
 
 - parameter delay:   Delay in seconds
 - parameter closure: Code to execute after delay
 */
func delayOnBackgroundQueue(delay: Double, closure: ()->()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), closure)
}

//NSDate

public func YUNGtimeOfTaipei() -> (String){

    let date = NSDate()
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.timeZone = NSTimeZone(name: "Asia/Taipei")
    let timeString = formatter.stringFromDate(date)
    
    return timeString
}








