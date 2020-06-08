//
//  ViewController.swift
//  Location And Places
//
//  Created by denys pashkov on 07/12/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    var locationManager = CLLocationManager()
    
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        Actual coordinate
        let locationValue: CLLocationCoordinate2D = manager.location!.coordinate
//		output as text
        currentLocation.text = String("\(locationValue.latitude) , \(locationValue.longitude)")
//		Last Location
        let userLocation = locations.last
//		Set Region
        let viewRegion = MKCoordinateRegion(center: userLocation!.coordinate, latitudinalMeters: 700, longitudinalMeters: 700)
//		Set on map
        self.map.setRegion(viewRegion, animated: true)
        
    }
    
}

