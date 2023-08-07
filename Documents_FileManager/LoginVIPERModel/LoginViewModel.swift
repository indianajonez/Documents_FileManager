//
//  LoginViewModel.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import Foundation


struct LoginViewModel {
    let state: LoginState

    enum LoginState: String {
        case withPassword = "Enter password"
        case withNoPassword = "Create a password"
        case needRepeatPassword = "Repeat password"
    }
}
