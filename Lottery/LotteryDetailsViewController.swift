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
    var extraction: LotteryExtraction!
    @IBOutlet weak var countDownLabel: CountdownLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        particlesAt(position: CGPoint(x: countDownLabel.frame.midX, y: countDownLabel.frame.midY))
//        self.title = extraction.name
    }

//    func startCountDown(){
//        countDownLabel.animationType = CountdownEffect.Evaporate
//        countDownLabel.setCountDownDate(targetDate: lottery.endDate! as NSDate)
//        countDownLabel.start()
//    }
}
