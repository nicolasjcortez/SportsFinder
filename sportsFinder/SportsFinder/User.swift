//
//  User.swift
//  SportsFinder
//
//  Created by Student on 2/2/16.
//  Copyright © 2016 Student. All rights reserved.
//


var list: Array<User> = Array<User>();


class User {
    
    var nome: String
    var email: String
    var senha: String
    
    
    
    init(nome: String, email: String, senha: String){
        self.email = email;
        self.nome = nome;
        self.senha = senha;
    }
    

}
