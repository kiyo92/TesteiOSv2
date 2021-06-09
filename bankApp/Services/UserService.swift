//
//  UserService.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 09/06/21.
//

import Foundation
import Combine

protocol UserDataService {
    func getUserData() -> UserAccountData
}

struct DefaultUserDataService: UserDataService {
    
    struct Response: Decodable {
        let authorized: Bool
        let user: User?
        
        struct User: Decodable {
            let firstName: String
            let lastName: String
        }
    }
    
    struct ServiceError: Decodable, Error {
        let message: String
    }
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    
    func getUserData() -> UserAccountData {
        do {
            if let bundlePath = Bundle.main.path(forResource: "UserData",
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let userAccountData = try JSONDecoder().decode(UserAccountData.self, from: jsonData)
                return userAccountData
            }
        } catch {
            print(error)
        }
        
        return UserAccountData()
    }
}
