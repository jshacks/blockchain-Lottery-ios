//
//  LotteryProvider.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import Foundation
import RxSwift

class LotteryProvider{
    var lotteries: Variable<[Lottery]> = Variable<[Lottery]>([])
    let service =  LottteryWebService()

    func sync(){
        service.getAllLotteries(callback: {self.lotteries.value = $0})
    }
}
