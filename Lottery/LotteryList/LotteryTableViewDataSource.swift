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
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date()),],
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
        let random = arc4random_uniform(10)
        let second = arc4random_uniform(25)
        let string = "0x1\(10 + second)f681646d4a755815f9cb19e1acc8\(random)65a0c\(random)ac"
        cell?.numberOfParticipantsLabel.text = string
        let rand = arc4random_uniform(170)
        let rand2 = arc4random_uniform(2)
        if rand2 > 0{
            let result = 3000 + rand
            cell?.winningsLabel.text = "$\(result)"
        }else{
            let result = 3000 - rand
            cell?.winningsLabel.text = "$\(result)"
        }

        return cell ?? UITableViewCell()
    }
}
