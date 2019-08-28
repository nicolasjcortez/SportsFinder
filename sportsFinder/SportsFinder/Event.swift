//
//  Event.swift
//  SportsFinder
//
//  Created by Student on 2/2/16.
//  Copyright © 2016 Student. All rights reserved.
//


var list_event: Array<Event> = Array<Event>()

class Event {
    
    var nome: String
    var esporte: String
    var descricao: String
    var latitude: Double
    var longitude: Double
    var date: String
    var numPlay: String
    
    
    
    
    
    init(nome: String, esporte: String, descricao: String, latitude: Double, longitude: Double, date: String, numPlay: String){
        
    self.nome = nome
    self.esporte = esporte
    self.descricao = descricao
    self.longitude = longitude
    self.latitude = latitude
    self.date = date
    self.numPlay = numPlay
       
    }
    


}
