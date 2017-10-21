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
    var dataSource: LotteryTableViewDataSource!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = LotteryTableViewDataSource(tableView: lotteryTableView)
        lotteryTableView.rx.itemSelected.asObservable().subscribe(didSelectItem).disposed(by: disposeBag)
    }

    func didSelectItem(_ event: Event<IndexPath>){
        guard let index = event.element else {return}
        if index.section == 0 {
            UIPasteboard.general.string = dataSource.lottery?.address
        }
        lotteryTableView.deselectRow(at: index, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let lotteryExtraction = sender as? LotteryExtraction,
            let destination = segue.destination as? LotteryDetailsViewController,
            segue.identifier == "presentLottery"{
            destination.extraction = lotteryExtraction
        }
    }

}

