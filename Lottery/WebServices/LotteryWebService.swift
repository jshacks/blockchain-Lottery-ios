//
//  LotteryWebService.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//
import Foundation
import Alamofire

class LottteryWebService: WebService{
    func getAllLotteries(callback: @escaping (Lottery)->Void){
        Alamofire.request(baseURL.appendingPathComponent("/lottery"), method: .get, headers: authHeader).response(completionHandler: { response in
            guard response.error == nil,
                let responseData = response.data
                else {return}
            callback(try! JSONDecoder().decode(Lottery.self, from: responseData))
        })
    }
}
