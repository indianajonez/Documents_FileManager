//
//  KeychainManager.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 04.08.2023.
//

import Foundation
import KeychainAccess


protocol KeychainManagerProtocol {
    // Проверка пороля
    func isPasswordValid(_ password: String) -> Bool
    // Если пароль уже существует
    func passwordExists() -> Bool
    // Сохранение пароля
    func savePassword(_ password: String, completion: @escaping (Bool, Error?) -> Void)
    // Удаление пароля
    func removePassword(completion: @escaping (Bool, Error?) -> Void)
}


final class KeychainManager {
    
    // MARK: - Private properties

    private let keychain = Keychain()
    private let key = "SwiftFileManager"
    
    
    // MARK: - Private methods

    private func getPassword() -> String? {
        guard let password = keychain[key] else {
            return nil
        }
        return password
    }
}


    // MARK: - KeychainManagerProtocol

extension KeychainManager: KeychainManagerProtocol {

    func passwordExists() -> Bool {
        guard getPassword() != nil else {
            return false
        }
        return true
    }

    func isPasswordValid(_ password: String) -> Bool {
        let keychainPassword = getPassword()
        guard let keychainPassword = keychainPassword else {
            return false
        }
        return keychainPassword == password
    }

    func savePassword(_ password: String, completion: @escaping (Bool, Error?) -> Void) {
        do {
            try keychain.set(password, key: key)
            completion(true, nil)
        } catch let error {
            print(error)
            completion(false, error)
        }
    }

    func removePassword(completion: @escaping (Bool, Error?) -> Void) {
        do {
            try keychain.remove(key)
            completion(true, nil)
        } catch let error {
            print(error)
            completion(false, error)
        }
    }
}
