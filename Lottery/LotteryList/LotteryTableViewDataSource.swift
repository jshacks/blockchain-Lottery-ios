//
//  LotteryTableViewDataSource.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit

class LotteryTableViewDataSource: NSObject, UITableViewDataSource{
    var lotteries: [Lottery] = []
    var lotteryProvider: LotteryProvider?

    override init(){
        self.lotteryProvider = LotteryProvider()
//        lotteryProvider
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lotteries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lotteryCell") as? LotterListCell
        cell?.nameLabel.text = lotteries[indexPath.row].name
        return cell ?? UITableViewCell()
    }
}
