//
//  MapViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 03/09/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    lazy var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.delegate = self
        
        requestAuthorization()
    }
    
    func requestAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //nível de acurancia do GPS. Quanto melhor, mais gasta bateria.
        locationManager.requestWhenInUseAuthorization()
    }

}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBar.text
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if (error == nil) {
                guard let response = response else {return}
                
                self.mapView.removeAnnotations(self.mapView.annotations)
                for item in response.mapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    annotation.subtitle = item.url?.absoluteString
                    
                    self.mapView.addAnnotation(annotation)
                }
                
                self.mapView.showAnnotations(self.mapView.annotations, animated: true)
                
            }
            
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth = 5.0
        renderer.strokeColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.userLocation.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: view.annotation!.coordinate))
        
        let directions = MKDirections(request: request)
        directions.calculate { (response, error) in
            if error == nil {
                guard let response = response,
                    let route = response.routes.first else {return}
                
                print("Nome:", route.name)
                print("Distância:", route.distance)
                print("Duração:", route.expectedTravelTime)
                
                for step in route.steps {
                    print("Em", step.distance, "m", step.instructions)
                }
                
                self.mapView.removeOverlays(self.mapView.overlays)
                self.mapView.addOverlay(route.polyline)
                
                
            }
        }
    }
}
