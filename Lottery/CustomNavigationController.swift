//
//  CustomNavigationController.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return .lightContent
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let font = UIFont(name: "Lato-Bold", size: 24)!
        navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
