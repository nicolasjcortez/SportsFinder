//
//  NewEventViewController.swift
//  SportsFinder
//
//  Created by Student on 2/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit


class NewEventViewController: UIViewController{

    @IBOutlet weak var name_label: UITextField!
    
    @IBOutlet weak var esporte_label: UIPickerView!
    
    @IBOutlet weak var date_picker: UIDatePicker!
    
    @IBOutlet weak var num_players: UITextField!
    
    @IBOutlet weak var descricao: UITextField!
    
    @IBOutlet weak var selecetLocBtn: UIButton!
    
    var pinLatitude: Double = 0
    var pinLongitude: Double = 0

    /*
    UIPickerViewDataSource, UIPickerViewDelegate 
    
    
    let esportesLista = ["Futebol", "Basquete"]
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    
    //self.esporte_label.dataSource = esportesLista
    self.esporte_label.dataSource = self
    self.esporte_label.delegate = self
    
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerDataSoruce.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return pickerDataSource[row]
    }


*/
    
    override func viewWillAppear(animated: Bool) {
        
        if (pinLatitude == 0)
        {
        selecetLocBtn.setTitle("Selecione o Local", forState: UIControlState.Normal)
        }
        else
        {
            selecetLocBtn.setTitle(String(pinLatitude) + ", " + String(pinLongitude), forState: UIControlState.Normal)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createEvent(sender: AnyObject) {
      
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm"
        
        print(dateFormatter.stringFromDate(date_picker.date))
       
        let event: Event = Event(nome: name_label.text!, esporte: "esporte", descricao: descricao.text!, latitude: pinLatitude, longitude: pinLongitude, date: dateFormatter.stringFromDate(date_picker.date), numPlay: num_players.text! )
      
        
        list_event.append(event)
        
        //dismiss view
        
               
        navigationController?.popViewControllerAnimated(true)

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("chamando a próxima view")
        
        if segue.identifier == "selectLoc" {
            let map = segue.destinationViewController as? MapViewController
            map!.isSelectingLoc = true
            map!.newEventView = self
            
            
        }
        
    }


}
