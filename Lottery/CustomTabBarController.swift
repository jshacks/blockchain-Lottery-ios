//
//  CustomTabBarController.swift
//  Lottery
//
//  Created by Cosmin Cucu on 10/22/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = viewControllers?.map({ controller in
            let font = UIFont(name: "Lato-Regular", size: 14)!
            controller.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: UIColor.white], for: .normal)
        })
    }

    override var selectedViewController: UIViewController?{
        willSet{
            let font = UIFont(name: "Lato-Regular", size: 14)!
            newValue?.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: UIColor(white: 1, alpha: 0.7)], for: .normal)
            selectedViewController?.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: UIColor(white: 1, alpha: 1)], for: .normal)
        }
    }
}

