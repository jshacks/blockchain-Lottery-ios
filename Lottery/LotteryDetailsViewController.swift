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
    @IBOutlet weak var nrParticipants: UILabel!
    @IBOutlet weak var prize: UILabel!
    var timer: Timer!
    var isShowingToast = false
    var didShow = false

    override func viewDidLoad() {
        super.viewDidLoad()
        addQR()
        addTapToCopy()
        addressLabel.text = "address: \(lottery?.address ?? "")"

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: getParticipants(_:))
        timer.fire()        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didShow = true
    }
    var emitter:CAEmitterLayer?

    func getParticipants(_ timer: Timer){
        LottteryWebService().getNumberOfParticipants(callback: { (participants) in
            if self.didShow && participants == 0 && self.emitter == nil{
                 self.emitter = self.particlesAt(position: CGPoint(x: self.view.frame.midX, y: self.view.frame.midY))
            }
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
                self.emitter?.removeFromSuperlayer()
                self.emitter = nil
            })
            self.nrParticipants.text = "\(participants) of 10"
            self.prize.text = "\(participants) ETH"
        })
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
