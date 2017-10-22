//
//  LotteryDetailsViewController.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit
import RxCocoa
import QRCode

class LotteryDetailsViewController: UIViewController{
    var lottery: Lottery? = Lottery(name: "Cea mai loterie",
                                    address: "0x83aedfffd13c42b6e91ef6569e3823ed55ae58ce",
                                    history:
        [LotteryExtraction(participants: ["sdaw", "dsad"], state: .running, date: nil),
         LotteryExtraction(participants: ["sdaw", "dsad"], state: .finished, date: Date())],
                                    numberOfParticipantsRequired: 15)
    var didLongPressBool = false
    @IBOutlet weak var codeImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!

    var isShowingToast = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addQR()
        addTapToCopy()
        addressLabel.text = "address: \(lottery?.address ?? "")"
    }

    func addQR(){
        var code = QRCode(lottery?.address ?? "")
        code?.backgroundColor = CIColor(red: 33/255, green: 45/255, blue: 58/255, alpha: 1)
        code?.color = .white
        codeImageView.image = code?.image
    }

    func addTapToCopy(){
       let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didLongPress))
        codeImageView.addGestureRecognizer(tapRecognizer)

    }

    @objc func didLongPress(_ recognizer: UITapGestureRecognizer){
        guard !isShowingToast else {return}
        UIPasteboard.general.string = lottery?.address
        isShowingToast = true
        view.makeToast("Address has been copied to clipboard", duration: 2, position: .bottom, completion: {_ in self.isShowingToast = false})
    }
}
