//
//  Bar.swift
//  Find the BAR
//
//  Created by Oleksandr SAPON on 6/3/18.
//  Copyright © 2018 Oleksandr SAPON. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation :  NSObject , MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title : String, subtitle : String, coordinate :CLLocationCoordinate2D ){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
