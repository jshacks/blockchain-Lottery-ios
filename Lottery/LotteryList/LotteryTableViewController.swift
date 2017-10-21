//
//  ViewController.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LotteryTableViewController: UIViewController {
    @IBOutlet weak var lotteryTableView: UITableView!
    @IBOutlet weak var newRaffleButton: UIButton!
    var dataSource: LotteryTableViewDataSource!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = LotteryTableViewDataSource(tableView: lotteryTableView)
        lotteryTableView.rx.itemSelected.asObservable().subscribe(didSelectItem).disposed(by: disposeBag)
    }

    func didSelectItem(_ event: Event<IndexPath>){
        guard let index = event.element else {return}
        let lottery = dataSource.lotteries[index.row]
        lotteryTableView.deselectRow(at: index, animated: true)
        performSegue(withIdentifier: "presentLottery", sender: lottery)
    }

    @IBAction func createNewLottery(_ sender: Any) {
        performSegue(withIdentifier: "newLottery", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let lottery = sender as? Lottery,
            let destination = segue.destination as? LotteryDetailsViewController,
            segue.identifier == "presentLottery"{
            destination.lottery = lottery
        }
    }
}

