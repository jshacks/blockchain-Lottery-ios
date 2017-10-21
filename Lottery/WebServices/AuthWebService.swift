//
//  AuthWebService.swift
//  Lottery
//
//  Created by serban chiricescu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import Foundation
import Alamofire

class AuthWebService: WebService{
    func signup(user: User ,callback: @escaping (User)->Void){
        Alamofire.request(baseURL.appendingPathComponent("/auth"))
    }
    
    func login(user: User ,callback: @escaping (User)->Void){
        Alamofire.request(baseURL.appendingPathComponent("/auth"))
    }
    
    func getUser(callback: @escaping (User)->Void){
        Alamofire.request(baseURL.appendingPathComponent("/auth"))
    }
}
