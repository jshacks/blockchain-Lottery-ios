//
//  ViewController.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit

class LotteryTableViewController: UIViewController {
    @IBOutlet weak var lotteryTableView: UITableView!
    @IBOutlet weak var newRaffleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createNewLottery(_ sender: Any) {
        performSegue(withIdentifier: "newLottery", sender: self)
    }

}

