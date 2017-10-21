//
//  LotteryDetailsViewController.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit
import CountdownLabel

class LotteryDetailsViewController: UIViewController{
    var lottery: Lottery!
    @IBOutlet weak var countDownLabel: CountdownLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startCountDown()
    }

    func startCountDown(){
        countDownLabel.animationType = CountdownEffect.Evaporate
        countDownLabel.setCountDownDate(targetDate: lottery.endDate! as NSDate)
        countDownLabel.start()        
    }
}
