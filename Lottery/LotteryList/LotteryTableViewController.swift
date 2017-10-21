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
        self.navigationItem.largeTitleDisplayMode = .never
    }
}

