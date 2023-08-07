//
//  LoginRouter.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import UIKit

protocol LoginRouterProtocol {
    func openTabBar()
    func dismiss()
}


final class LoginRouter {
    weak var viewController: UIViewController?

    init() {}

    private func present(
        _ presentedViewController: UIViewController,
        modalPresentationStyle: UIModalPresentationStyle,
        animated: Bool = true
    ) {
        presentedViewController.modalPresentationStyle = modalPresentationStyle
        viewController?.present(presentedViewController, animated: animated)
    }
}

extension LoginRouter: LoginRouterProtocol {
    func openTabBar() {
        let navigationController = UINavigationController(rootViewController: TabBarViewController())
        navigationController.isNavigationBarHidden = true
        present(navigationController, modalPresentationStyle: .overCurrentContext, animated: true)
    }

    func dismiss() {
        viewController?.dismiss(animated: true)
    }
}
