//
//  Lottery.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import Foundation

class Lottery: Codable{
    let id: String?
    let name: String?
    let endDate: Date?
    var winner: String?
    var founder: String?
    var comision: Double?

    init(id: String, name: String, endDate: Date?, winner: String?, founder: String?, comision: Double?) {
        self.id = id
        self.name = name
        self.endDate = endDate
        self.winner = winner
        self.founder = founder
        self.comision = comision
    }
}
