//
//  aboutVC.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/22/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit

class AboutVC: UIViewController{

    @IBOutlet weak var scroll: UIScrollView!

    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return .lightContent
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.contentInset.top = -20
    }
}
