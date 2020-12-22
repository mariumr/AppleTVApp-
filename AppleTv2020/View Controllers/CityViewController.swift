//
//  CityViewController.swift
//  Marium_FinalExam2020
//
//  Created by Xcode User on 2020-12-13.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class CityViewController: UIViewController , MKMapViewDelegate, UITableViewDelegate{

    var x =  37.774929
    var y = -122.419416
    var city = ""
    let locationManager = CLLocationManager()
    var initialLocation = CLLocation(latitude: 43.653226, longitude: -79.383184)
    @IBOutlet var myMapView : MKMapView!
    
    let cityData =  CityDetails()
    
    func updateCityLocation(select : Int)  {
        
    city = cityData.cityNames[select]
     x = cityData.cityLat[select]
     y = cityData.cityLong[select]
        
    initialLocation = CLLocation(latitude: x, longitude: y )
    
    }
    
    let regionRadius : CLLocationDistance = 1000
    func centerMapOnLocation(location : CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius)
        myMapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(location: initialLocation)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = initialLocation.coordinate
        dropPin.title = city
        self.myMapView.addAnnotation(dropPin)
        self.myMapView.selectAnnotation(dropPin, animated: true)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
