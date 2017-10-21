//
//  UserDefaults.swift
//  Lottery
//
//  Created by serban chiricescu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import Foundation

struct Defaults{
    let userDefaults: UserDefaults?
    init(userDefaults: UserDefaults? = UserDefaults.standard){
        self.userDefaults = userDefaults
    }
    
    func login(user: User, token: String){
        save(user: user)
        save(token: token)
        userDefaults?.synchronize()
    }
    
    func logout(){
        userDefaults?.set(nil, forKey: "token")
        userDefaults?.set(nil, forKey: "user")
    }
    
    func getUser()->User?{
        guard let userDictionary = userDefaults?.value(forKey: "user") as? Data else {
            return nil
        }
        let user = try! JSONDecoder().decode(User.self, from: userDictionary)
        return user
    }
    
    func getToken()->String?{
        return userDefaults?.value(forKey: "token") as? String
    }
    
    func save(token: String){
        guard token.characters.count > 0 else { return }
        userDefaults?.set(token, forKey: "token")
    }
    
    func save(user: User){
       try! userDefaults?.set(JSONEncoder().encode(user), forKey: "user")
    }
}
