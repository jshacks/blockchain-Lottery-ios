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
import Toast_Swift

class LotteryTableViewController: UIViewController {
    @IBOutlet weak var lotteryTableView: UITableView!
    var dataSource: LotteryTableViewDataSource!
    var disposeBag = DisposeBag()
    var didLongPressBool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        lotteryTableView.tableFooterView = UIView()        
        dataSource = LotteryTableViewDataSource(tableView: lotteryTableView)        
        lotteryTableView.rx.itemSelected.asObservable().subscribe(didSelectItem).disposed(by: disposeBag)
    }

    func didSelectItem(_ event: Event<IndexPath>){
        guard let index = event.element else {return}
        let lottery = dataSource.lottery?.history?[index.row]
        lotteryTableView.deselectRow(at: index, animated: true)
        performSegue(withIdentifier: "presentLottery", sender: lottery)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let lotteryExtraction = sender as? LotteryExtraction,
            let destination = segue.destination as? LotteryDetailsViewController,
            segue.identifier == "presentLottery"{
//            destination.extraction = lotteryExtraction
        }
    }

}

