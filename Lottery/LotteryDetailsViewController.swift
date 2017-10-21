//
//  LotteryDetailsViewController.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit
import QRCode

class LotteryDetailsViewController: UIViewController{
    var lottery: Lottery? = Lottery(name: "Cea mai loterie",
                                    address: "someWallet",
                                    history:
        [LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date())],
                                    numberOfParticipantsRequired: 15)
    var didLongPressBool = false
    @IBOutlet weak var codeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addQR()
    }

    func addQR(){
        var code = QRCode(lottery?.address ?? "")
        code?.backgroundColor = CIColor(red: 33/255, green: 45/255, blue: 58/255, alpha: 1)
        code?.color = .white
        codeImageView.image = code?.image
    }

    func addLongTap(){
//        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress))
//        lotteryTableView.addGestureRecognizer(recognizer)
    }

    @objc func didLongPress(_ recognizer: UILongPressGestureRecognizer){
        if recognizer.state == .ended{
            didLongPressBool = false
            return
        }
        guard !didLongPressBool else {return}
        didLongPressBool = true
        UIPasteboard.general.string = lottery?.address
        view.makeToast("Address has been pasted", duration: 2, position: .bottom)
    }
}
