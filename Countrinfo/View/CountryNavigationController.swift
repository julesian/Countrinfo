//
//  CountryNavigationController.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/18/21.
//

import UIKit

class CountryNavigationController : UINavigationController {

    override var preferredStatusBarStyle : UIStatusBarStyle {
        if let lastViewController = viewControllers.last {
            return lastViewController.preferredStatusBarStyle
        }

        return .default
    }
}
