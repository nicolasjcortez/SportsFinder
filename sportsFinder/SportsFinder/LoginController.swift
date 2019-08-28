//
//  LoginController.swift
//  SportsFinder
//
//  Created by Student on 2/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var eMailTextfield: UITextField!
    
    @IBOutlet weak var incorretLogin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        incorretLogin.hidden = true
        
        list.append(User(nome: "Wesley o Safadao", email: "wesley_safadao@gmail.com", senha: "wesley"))
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginVerify(sender: AnyObject) {
        
        
        
        
        if (eMailTextfield.text == list[0].email && passwordTextfield.text == list[0].senha
            )
        {//usuario autorizado
            self.performSegueWithIdentifier("segueLogin", sender: self)
           print("logado")
        }
        else
        
        {
            //usuario nao autorizado
            print("nao autorizado")
            incorretLogin.hidden = false;
        }
        
        
        
        
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
