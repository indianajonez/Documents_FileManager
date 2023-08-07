//
//  TabBarFactory.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import UIKit

final class Factory {

    enum Flow {
        case files
        case settings
    }

    let navigationController: UINavigationController = UINavigationController()
    let flow: Flow

    init(
        flow: Flow
    ) {
        self.flow = flow
        startModule()
    }

    func startModule() {
        switch flow {
        case .files:
            let controller = FilesViewController()

            navigationController.tabBarItem = UITabBarItem(title: "Files", image: UIImage(systemName: "doc"), selectedImage: nil)
            navigationController.setViewControllers([controller], animated: true)
        case .settings:
            let controller = SettingsViewController()

            navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), selectedImage: nil)
            navigationController.setViewControllers([controller], animated: true)
        }
    }
}
