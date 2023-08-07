//
//  LoginInput.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import Foundation


struct LoginInput {
    let entryPoint: EntryPoint

    enum EntryPoint {
        case startApp
        case settings
    }
}
