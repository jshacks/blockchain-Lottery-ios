//
//  User.swift
//  Lottery
//
//  Created by serban chiricescu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: String
    let email: String
    let pass: String?
    let walletId: String?
    
    init(id: String, email: String, pass: String? = nil, walletId: String?){
        self.id = id
        self.email = email
        self.pass = pass
        self.walletId = walletId
    }
}

