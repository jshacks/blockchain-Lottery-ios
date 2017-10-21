//
//  UserService.swift
//  Lottery
//
//  Created by serban chiricescu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import Foundation

struct UserService {
    let authWebService: AuthWebService
    
    func signup(user: User ,callback: @escaping (Bool)->Void){
        authWebService.signup(user: user, callback: {
            user in
            callback(true)
        })
    }
    
    func login(user: User ,callback: @escaping (Bool)->Void){
        authWebService.login(user: user, callback: {
            user in
            callback(true)
        })
    }
    
    func getUser(callback: @escaping (User)->Void){
        authWebService.getUser(callback: {
            user in
            callback(User(id: "iasd", email: "ceva@ceva.com", pass: "pass", walletId: "id"))
        })
    }
}
