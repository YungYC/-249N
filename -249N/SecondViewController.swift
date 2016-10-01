//
//  SecondViewController.swift
//  -249N
//
//  Created by Duncan on 2016/7/2.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, MKMapViewDelegate {

    //let locationManager = CLLocationManader()

    
    var locationX: CLLocationDegrees = 24.950356
    var locationY: CLLocationDegrees = 121.227095
    var isOpen = false
    var openTitle = "常駐地點"
    var openDescription = "每週一四五固定開攤！"
    let annotation = MKPointAnnotation()

    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var isOnlineDot: UIImageView!
    @IBOutlet weak var isOnlineLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMap.delegate = self

        
        DataRef.child("開攤位置").child("isOpen").observeEventType(.Value, withBlock: { (FIRDataSnapshot) in
            //print(FIRDataSnapshot)
            self.isOpen = FIRDataSnapshot.value as! Bool
            //print(self.isOpen)
            
            if self.isOpen {
                self.isOnlineDot.image = UIImage(named: "online")
                self.isOnlineLabel.text = "開攤營業中"
                
                DataRef.child("開攤位置").observeSingleEventOfType(.Value, withBlock: { (FIRDataSnapshot) in
                    print("Im in")
                    let data = FIRDataSnapshot.value as! NSDictionary
                    self.locationX = data["locationX"] as! CLLocationDegrees
                    self.locationY = data["locationY"] as! CLLocationDegrees
                    self.openTitle = data["title"] as! String
                    self.openDescription = data["description"] as! String
                    
                    print(self.openDescription)
                    self.mapWithAnnotation(self.locationX, locationY: self.locationY, title: self.openTitle, Description: self.openDescription)
                })

            }else{
                self.isOnlineDot.image = UIImage(named: "offline")
                self.isOnlineLabel.text = "尚未開攤"
                
                self.locationX = 24.950356
                self.locationY = 121.227095
                self.openTitle = "常駐地點"
                self.openDescription = "每週一四五固定開攤！"
                
                self.mapWithAnnotation(self.locationX, locationY: self.locationY, title: self.openTitle, Description: self.openDescription)

            }


        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        print(userLocation.location)
    }

    func mapWithAnnotation(locationX: CLLocationDegrees, locationY: CLLocationDegrees, title: String, Description: String) {
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locationX, locationY)
        let xScale: CLLocationDegrees = 0.01
        let yScale: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpanMake(yScale, xScale)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        myMap.setRegion(region, animated: true)
        
        annotation.coordinate = location
        annotation.title = title
        
        annotation.subtitle = Description
        myMap.addAnnotation(annotation)
        myMap.selectAnnotation(myMap.annotations[0], animated: true)
    }
}




