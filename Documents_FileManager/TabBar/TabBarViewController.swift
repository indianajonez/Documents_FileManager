//
//  TabBarViewController.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    

    private let filesViewController = Factory(flow: .files)
    private let settingsViewController = Factory(flow: .settings)

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        setControllers()
    }

    private func setControllers() {
        viewControllers = [
            filesViewController.navigationController,
            settingsViewController.navigationController
        ]
    }
}
