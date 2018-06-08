//
//  BarViewController.swift
//  Find the BAR
//
//  Created by Oleksandr SAPON on 6/3/18.
//  Copyright © 2018 Oleksandr SAPON. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class BarViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var pinBarCoordinates: MKMapView!
    
    let locationManager = CLLocationManager()
    var currLocation : CLLocation!
    var checkLoc = false
    var index: Int!

    struct Point {
        var title : String
        var subtitle: String
        var latitude : Double
        var longitude : Double
    }
    
    var bars = [
        Point(title: "UNIT Factory", subtitle: "Programming school", latitude: 50.4688257, longitude: 30.462158799999997),
        Point(title: "Porter Pub", subtitle: "Bar near programming school", latitude: 50.46978369623649, longitude: 30.459530353546143),
        Point(title: "Banka Bar", subtitle: "Small bar with many jars", latitude: 50.47045199999999, longitude: 30.446118999999953)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HERE", index)
//        piBarTitle = bar?.title
//        pinBarSubtitle.text = bar?.subtitle
//        pinBarCoordinates.CLLocationCoordinate2D = bar?.coordinate
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        pinBarCoordinates.mapType = .hybrid
        pinBarCoordinates.showsUserLocation = true
        mapAddPoint(title : bars[index].title, subTitle : bars[index].subtitle, lat : bars[index].latitude, long : bars[index].longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let span = MKCoordinateSpanMake(0.00775, 0.00775)
            let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
            let region = MKCoordinateRegionMake(myLocation, span)
            pinBarCoordinates.setRegion(region, animated: true)
        }
        self.pinBarCoordinates.showsUserLocation = true
        locationManager.stopUpdatingLocation()
    }
    
    func mapAddPoint(title : String, subTitle : String, lat : Double, long : Double) {
        centerMapOnLocation(location : CLLocation(latitude: lat, longitude: long))
        let school42 = MKPointAnnotation();
        school42.title = title
        school42.subtitle = subTitle
        school42.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long);
        pinBarCoordinates.addAnnotation(school42)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        pinBarCoordinates.setRegion(coordinateRegion, animated: true)
    }

}
