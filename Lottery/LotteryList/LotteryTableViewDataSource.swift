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
    var lottery: Lottery? = Lottery(name: "Cea mai loterie",
                                    address: "someWallet",
                                    history:
                                        [LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
                                         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date())],
                                    numberOfParticipantsRequired: 15)
    var runningExtractions: [LotteryExtraction] = []
    var finishedExtractions: [LotteryExtraction] = []
    weak var tableView: UITableView?
    var disposeBag = DisposeBag()

    init(tableView: UITableView){
        super.init()
        self.tableView = tableView
        tableView.dataSource = self
        self.runningExtractions = self.lottery?.history?.filter({$0.state == .running}) ?? []
        self.finishedExtractions = self.lottery?.history?.filter({$0.state == .finished}) ?? []
    }

    func sync(){
        LottteryWebService().getAllLotteries(callback: { response in
            self.lottery = response
            self.runningExtractions = self.lottery?.history?.filter({$0.state == .running}) ?? []
            self.finishedExtractions = self.lottery?.history?.filter({$0.state == .finished}) ?? []
            self.tableView?.reloadData()
        })
    }

    func lotteriesDidChange(_ event: Event<Lottery>){
        self.lottery = event.element
        self.tableView?.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return runningExtractions.count
        }else{
            return finishedExtractions.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lotteryCell") as? LotterListCell
        let extraction = indexPath.section == 0 ? runningExtractions[indexPath.row] : finishedExtractions[indexPath.row]
        cell?.numberOfParticipantsLabel.text = "\(extraction.participants?.count ?? 0) of \(lottery?.numberOfParticipantsRequired ?? 0)"
        cell?.winningsLabel.text = "$99999"
        return cell ?? UITableViewCell()
    }
}
