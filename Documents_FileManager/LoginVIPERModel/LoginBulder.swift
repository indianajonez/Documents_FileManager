//
//  LoginBulder.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import UIKit


protocol LoginBuilderProtocol {
    func build(input: LoginInput) -> UIViewController
}


final class LoginBuilder: LoginBuilderProtocol {
    
    // MARK: - Public methods

    func build(input: LoginInput) -> UIViewController {
        let viewController = LoginViewController()
        let router = LoginRouter()
        let presenter = LoginPresenter(viewController: viewController)
        router.viewController = viewController
        let interactor = LoginInteractor(input: input, router: router, presenter: presenter)
        viewController.interactor = interactor

        return viewController
    }
}
