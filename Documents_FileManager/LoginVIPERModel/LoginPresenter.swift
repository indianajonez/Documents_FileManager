//
//  LoginPresenter.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import Foundation


protocol LoginPresenterProtocol {
    // Обновление вью с текстфилдом для повторного ввода пароля
    func updateView(hasPassword: Bool, needRepeat: Bool)
}


final class LoginPresenter {
    
    typealias ViewModel = LoginViewModel
    weak var viewController: LoginViewControllerProtocol?
    
    init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func updateView(hasPassword: Bool, needRepeat: Bool) {
        
        guard !needRepeat else {
            viewController?.updateButton(with: ViewModel(state: .needRepeatPassword))
            return
        }
        
        let state: LoginViewModel.LoginState = hasPassword ? .withPassword : .withNoPassword
        let viewModel = ViewModel(state: state)
        viewController?.updateButton(with: viewModel)
    }
}
