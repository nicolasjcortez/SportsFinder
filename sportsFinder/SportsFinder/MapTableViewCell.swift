//
//  MapTableViewCell.swift
//  SportsFinder
//
//  Created by Student on 2/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell, CLLocationManagerDelegate{
    
    @IBOutlet weak var map: MKMapView!
    var LocationManager = CLLocationManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setLocation(LocationMagager: CLLocationManager)
    {
        LocationManager = LocationMagager
        map.showsUserLocation = true // Mostra a bolinha bonitinha
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last // faz com que seja usado a ultima localização usada
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude) //faz com quem a longitude e latitude usadas sejam da ultima localização
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)) // isso controla o zoom que será feito no mapa
        
        map.setRegion(region, animated: true)// faz com que o mapa vá para essa localização e que faça o zoom
        
        
        self.LocationManager.stopUpdatingLocation()
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
        
        self.map.addAnnotation(annotation) //adiciona o pin no mapa
        
        }
    }
    
}
