//
//  SecondViewController.swift
//  Find the BAR
//
//  Created by Oleksandr SAPON on 6/2/18.
//  Copyright © 2018 Oleksandr SAPON. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var myIndex = 0
    let bars = ["UNIT Factory", "Porter Pub", "Banka Bar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let unit = PinAnnotation(title: "UNIT Factory", subtitle: "Programming school", coordinate: CLLocationCoordinate2DMake(50.4688257, 30.462158799999997))
//        bars.append(unit)
//        let porter = PinAnnotation(title: "Porter Pub", subtitle: "Bar near programming school", coordinate: CLLocationCoordinate2DMake(50.46978369623649, 30.459530353546143))
//        bars.append(porter)
//        let banka = PinAnnotation(title: "Banka Bar", subtitle: "Small bar with many jars", coordinate: CLLocationCoordinate2DMake(50.47045199999999, 30.446118999999953))
//        bars.append(banka)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell") as! PlacesBTableViewCell
        cell.barlbl.text = bars[indexPath.row]
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedIndex = indexPath.row
//        performSegue(withIdentifier: "pinTab", sender: self)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        myIndex = indexPath.row
        performSegue(withIdentifier: "pinTab", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BarViewController {
            destination.index = myIndex
        }
    }
}

