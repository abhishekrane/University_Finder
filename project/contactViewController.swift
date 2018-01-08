//
//  contactViewController.swift
//  project
//
//  Created by Abhishek rane on 12/15/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class contactViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.6,0.6)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(32.7157,-117.1611)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated:true)
        
        let Mylocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(32.795042, -116.962349)
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = Mylocation
        annotation1.title = "Our Location"
        
        map.addAnnotation(annotation1)
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
