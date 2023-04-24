//
//  CryptoAES.swift
//  CryptoAES
//
//  Created by JunHyeok Lee on 2023/04/24.
//

import Foundation

public struct CryptoAES {
    private let key: String?
    private var iv: String? = "0123456789101112"
    
    public init(key: String?, iv: String?) {
        self.key = key
        self.iv = iv
    }
}

// MARK: - Encryption
extension CryptoAES {
    public func encryption(_ text: String) -> String? {
        guard let key = self.key else { return "Key not initialized"}
        guard let encryptedString = AES256CBC.encryptString(text, password: key) else {
            print("Encryption failed")
            return nil
        }
        return encryptedString != "" ? encryptedString : nil
    }
    
    public func encryption(_ text: String, password: String) -> String? {
        guard let iv = self.iv else { return "IV not initialized" }
        guard let encryptedString = AES256CBC.encryptString(text, password: password, iv: iv) else {
            print("Encryption failed")
            return nil
        }
        return encryptedString != "" ? encryptedString : nil
    }
    
    public func encryption(_ text: String, password: String, iv: String) -> String? {
        guard let encryptedString = AES256CBC.encryptString(text, password: password, iv: iv) else {
            print("Encryption failed")
            return nil
        }
        return encryptedString != "" ? encryptedString : nil
    }
}

// MARK: - Decryption
extension CryptoAES {
    public func decryption(_ text: String) -> String? {
        guard let key = key else { return "Key not initialized"}
        guard let decryptedString = AES256CBC.decryptString(text, password: key) else {
            print("Decryption failed")
            return nil
        }
        return decryptedString != "" ? decryptedString : nil
    }
    
    public func decryption(_ text: String, password: String) -> String? {
        guard let decryptedString = AES256CBC.decryptString(text, password: password) else {
            print("Decryption failed")
            return nil
        }
        return decryptedString != "" ? decryptedString : nil
    }
    
    public func decryption(_ text: String, password: String, iv: String) -> String? {
        guard let decryptedString = AES256CBC.encryptString(text, password: password, iv: iv) else {
            print("DEcryption failed")
            return nil
        }
        return decryptedString != "" ? decryptedString : nil
    }
}
