//
//  LotteryTableViewDataSource.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit
import RxSwift

class LotteryTableViewDataSource: NSObject, UITableViewDataSource{
    var lotteries: [Lottery] = [Lottery(id: "someId", name: "Loterie #1", endDate: Date().addingTimeInterval(5 * 60), winner: nil, founder: nil, comision: nil)]
    var lotteryProvider: LotteryProvider?
    weak var tableView: UITableView?
    var disposeBag = DisposeBag()

    init(tableView: UITableView){
        super.init()
        self.tableView = tableView
        tableView.dataSource = self
        self.lotteryProvider = LotteryProvider()
//        lotteryProvider?.lotteries.asObservable().subscribe(lotteriesDidChange).disposed(by: disposeBag)
    }

    func lotteriesDidChange(_ event: Event<[Lottery]>){
        self.lotteries = event.element ?? []
        self.tableView?.reloadData()
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