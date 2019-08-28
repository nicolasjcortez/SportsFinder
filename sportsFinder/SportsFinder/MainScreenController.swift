//
//  MainScreenController.swift
//  SportsFinder
//
//  Created by Student on 2/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

//eu commitei

import UIKit
import CoreLocation
import MapKit

class MainScreenController: UITableViewController, CLLocationManagerDelegate {
    
    
    let LocationManager = CLLocationManager()
    var cellmaps =  MapTableViewCell()
    
    override func viewDidLoad() {
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))
        
        super.viewDidLoad()
        self.LocationManager.delegate = self
        
        self.LocationManager.desiredAccuracy = kCLLocationAccuracyBest //aumentando a "certeza" da localização
        
        self.LocationManager.requestWhenInUseAuthorization() //faz com que que o mapa rode somente qnd estiver sendo usado
        
        self.LocationManager.startUpdatingLocation() //"liga" o locationmannager
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        print("numero de linhas: ", 2 + list_event.count)
        return 2 + list_event.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //var cell: UITableViewCell
        
        if (indexPath.row == 0)
        {
            let cellperfil = tableView.dequeueReusableCellWithIdentifier("perfil", forIndexPath: indexPath) as! UserTableViewCell
            tableView.rowHeight = 100
            
            cellperfil.backgroundView = UIImageView(image: UIImage(named: "background"))
            cellperfil.userNameLabel.text = list[0].nome
            cellperfil.userImg.image = UIImage(named: "wesley")
            
            return cellperfil
        }
        else if(indexPath.row == 1){
            self.cellmaps = tableView.dequeueReusableCellWithIdentifier("maps", forIndexPath: indexPath) as! MapTableViewCell
            self.cellmaps.setLocation(LocationManager);
            self.cellmaps.setPins()
            cellmaps.backgroundView = UIImageView(image: UIImage(named: "background"))
            tableView.rowHeight = 300
            return cellmaps
            
        }
        
            let cell = tableView.dequeueReusableCellWithIdentifier("events", forIndexPath: indexPath) as! EventTableViewCell
            
            tableView.rowHeight = 170
        
        cell.backgroundView = UIImageView(image: UIImage(named: "background"))
        cell.nameLabel.text = list_event[indexPath.row - 2].nome
        cell.eventImg.image = UIImage(named: "soccer_image")
        cell.timeLabel.text = "Data: " + list_event[indexPath.row - 2].date
        cell.num_play.text = "Num Pessoas: 1/" + list_event[indexPath.row - 2].numPlay
        //cell.date.text = list_event[indexPath.row - 2].date
        //latitude = list_event[indexPath.row - 2].
        // Configure the cell...
        return cell
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.cellmaps.locationManager(manager, didUpdateLocations: locations )
    }
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
