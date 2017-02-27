//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Sunny NG on 28/2/2017.
//  Copyright © 2017 Sunny NG. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    var locationManager = CLLocationManager()
    var beginningLocation: CLLocation!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginningLocation = nil
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetDistance(_ sender: Any) {
        beginningLocation = nil
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let theMostRecentLocation = locations[locations.count - 1]
        latitude.text = String(theMostRecentLocation.coordinate.latitude)
        longitude.text = String(theMostRecentLocation.coordinate.longitude)
        altitude.text = String(theMostRecentLocation.altitude)
        print("horizontal accuracy: \(theMostRecentLocation.horizontalAccuracy)")
        print("vertial accuracy: \(theMostRecentLocation.verticalAccuracy)")
        
        if beginningLocation == nil {
            beginningLocation = theMostRecentLocation
        }
        
        let distanceUpdate = theMostRecentLocation.distance(from: beginningLocation)
        self.distance.text = String(format: "%.2f", distanceUpdate)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // put your error handling codes here
        print("Error: \(error.localizedDescription)")
    }
    
}

