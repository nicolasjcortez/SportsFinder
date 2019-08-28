//
//  MapViewController.swift
//  SportsFinder
//
//  Created by Student on 2/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let LocationManager = CLLocationManager()
    var isSelectingLoc = false
    var newEventView: NewEventViewController = NewEventViewController()
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.LocationManager.delegate = self
        
        self.LocationManager.desiredAccuracy = kCLLocationAccuracyBest //aumentando a "certeza" da localização
        
        self.LocationManager.requestWhenInUseAuthorization() //faz com que que o mapa rode somente qnd estiver sendo usado
        
        self.LocationManager.startUpdatingLocation() //"liga" o locationmannager
        
        self.mapView.showsUserLocation = true // Mostra a bolinha bonitinha
        setPins()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last // faz com que seja usado a ultima localização usada
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude) //faz com quem a longitude e latitude usadas sejam da ultima localização
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)) // isso controla o zoom que será feito no mapa
        
        self.mapView.setRegion(region, animated: true)// faz com que o mapa vá para essa localização e que faça o zoom
        
        self.LocationManager.stopUpdatingLocation()
    }
    
    @IBAction func addPin(sender: UILongPressGestureRecognizer) {
        
        print("reconheceu")
        if(isSelectingLoc)//se veio do selecione mapa
        {
            print("true")
            let location = sender.locationInView(self.mapView)//carrega aonde foi tocado
            
        
            let locCoord = self.mapView.convertPoint(location, toCoordinateFromView:self.mapView)//a coordenada da localização
            
            newEventView.pinLatitude = locCoord.latitude
            newEventView.pinLongitude = locCoord.longitude
        
            let annotation = MKPointAnnotation()// cria aanotação
        
            annotation.coordinate = locCoord
            annotation.title = "Localizacao Evento"
        
        
            self.mapView.removeAnnotations(mapView.annotations)
        
            self.mapView.addAnnotation(annotation) //adiciona o pin no mapa
        }
        
    }
    
    func setPins(){
        
        
        for(var i=0;i<list_event.count;i++)
        {
            
            let annotation = MKPointAnnotation()// cria aanotação
            
            var coordinate = CLLocationCoordinate2D()
            coordinate.latitude = list_event[i].latitude
            
            coordinate.longitude = list_event[i].longitude
            
            
            annotation.coordinate = coordinate
            annotation.title = list_event[i].nome
            
            self.mapView.addAnnotation(annotation) //adiciona o pin no mapa
            
        }
    }
}
