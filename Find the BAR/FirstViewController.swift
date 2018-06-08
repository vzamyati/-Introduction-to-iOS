//
//  FirstViewController.swift
//  Find the BAR
//
//  Created by Oleksandr SAPON on 6/2/18.
//  Copyright © 2018 Oleksandr SAPON. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    @IBAction func mapView(_ sender: UISegmentedControl) {
    
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    
    }
    
    @IBAction func refLocation(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapType = .hybrid
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(50.4688257, 30.462158799999997)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        
        let annotation = PinAnnotation(title: "Unit Factory", subtitle: "Programming school", coordinate: location)
        
//        annotation.coordinate = location
//        annotation.title = "UNIT Factory"
//        annotation.subtitle = "Programming school"
        mapView.addAnnotation(annotation)

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location, 1500, 1500), animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let span = MKCoordinateSpanMake(0.00775, 0.00775)
            let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
            let region = MKCoordinateRegionMake(myLocation, span)
            mapView.setRegion(region, animated: true)
        }
        self.mapView.showsUserLocation = true
        locationManager.stopUpdatingLocation()
    }
    
}


