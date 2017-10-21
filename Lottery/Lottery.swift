//
//  Lottery.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import Foundation

class Lottery: Codable{
    let name: String?
    let address: String?
    var history: [LotteryExtraction]?

    init(name: String, address: String?, history: [LotteryExtraction]?){
        self.name = name
        self.address = address
        self.history = history
    }
}

class LotteryExtraction: Codable{
    enum ExtractionState: String, Codable {
        case finished = "finished"
        case running = "running"
    }

    var participants: [String]?
    var state: ExtractionState?

    init(participants: [String]?, state: ExtractionState?) {
        self.participants = participants
        self.state = state
    }
}
