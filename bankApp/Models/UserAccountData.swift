//
//  UserAccountData.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 09/06/21.
//

import Foundation
struct UserAccountData: Codable {
    let user: UserData?
    let account: AccountData?
    let transactions: [TransactionData]?
    
    init(){
        user = UserData()
        account = AccountData()
        transactions = []
    }
}
struct UserData: Codable {
    let name: String?
    
    init(){
        name = ""
    }
}

struct AccountData: Codable {
    let agency: String?
    let accountNumber: String?
    let accountBalance: Double?
    
    init(){
        agency = ""
        accountNumber = ""
        accountBalance = 0
    }
}
struct TransactionData: Codable {
    let type: String?
    let value: Double?
    let description: String?
    let date: String?
}


