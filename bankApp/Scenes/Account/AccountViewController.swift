//
//  AccountViewController.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import Foundation
import UIKit
import SnapKit
protocol AccountViewControllerInput: AnyObject {
    func showUserDataSuccess(user: UserAccountData)
    func showUserDataFailure(message: String)
}

protocol AccountViewControllerOutput: AnyObject {
    func getUserData()
}

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var interactor: AccountInteractorInput?
    var router: LoginRouting?
    var transactions: [TransactionData] = []
    
    private var accountInfoContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.2862745098, blue: 0.9333333333, alpha: 1)
        return view
    }()
    private var holderNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Testildo da silva Teste"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        return label
    }()
    private var exitButton: UIButton = {
        let btn = UIButton(frame: CGRect.zero)
        let image = UIImage(named: "logout")
        btn.setImage(image, for: .normal)
        btn.imageView?.snp.makeConstraints(){make in
            make.edges.equalToSuperview()
        }
        return btn
    }()
    private var accountLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Conta"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        return label
    }()
    private var accountDataLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "2050 / 01.111222-4"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        return label
    }()
    private var balanceLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Saldo"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        return label
    }()
    private var balanceDataLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "R$ 1000,00"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        return label
    }()
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(StatementTableViewCell.self, forCellReuseIdentifier: "statementCell")
        table.separatorColor = .clear
        table.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        interactor?.getUserData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! StatementTableViewCell
        
        cell.setup()
        cell.setData(transaction: transactions[indexPath.row])
        
        return cell
    }
}

private extension AccountViewController {
    func setupUI() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupAccountInfo()
    }
    
    func setupAccountInfo(){
        view.addSubview(accountInfoContainer)
        view.addSubview(tableView)
        accountInfoContainer.addSubview(holderNameLabel)
        accountInfoContainer.addSubview(exitButton)
        accountInfoContainer.addSubview(accountLabel)
        accountInfoContainer.addSubview(accountDataLabel)
        accountInfoContainer.addSubview(balanceLabel)
        accountInfoContainer.addSubview(balanceDataLabel)
        
        
        accountInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        accountInfoContainer.snp.makeConstraints(){make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
        }
        tableView.snp.makeConstraints(){make in
            make.top.equalTo(accountInfoContainer.snp.bottom).offset(50)
            make.trailing.leading.bottom.equalToSuperview()
        }
        
        holderNameLabel.snp.makeConstraints(){make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.leading.equalToSuperview().inset(18)
            make.trailing.equalTo(exitButton.snp.leading).inset(20)
        }
        exitButton.snp.makeConstraints(){make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.trailing.equalToSuperview().inset(13)
            make.height.width.equalTo(27)
        }
        
        accountLabel.snp.makeConstraints(){make in
            make.top.equalTo(holderNameLabel.snp.bottom).offset(28)
            make.trailing.leading.equalToSuperview().inset(18)
        }
        accountDataLabel.snp.makeConstraints(){make in
            make.top.equalTo(accountLabel.snp.bottom).offset(6)
            make.trailing.leading.equalToSuperview().inset(18)
        }
        balanceLabel.snp.makeConstraints(){make in
            make.top.equalTo(accountDataLabel.snp.bottom).offset(21)
            make.trailing.leading.equalToSuperview().inset(18)
        }
        balanceDataLabel.snp.makeConstraints(){make in
            make.top.equalTo(balanceLabel.snp.bottom).offset(6)
            make.trailing.leading.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(17)
        }
        
    }
    
}

extension AccountViewController: AccountViewControllerInput {
    func showUserDataSuccess(user: UserAccountData) {
        holderNameLabel.text = user.user?.name
        accountDataLabel.text = "\(user.account?.agency ?? "") / \(user.account?.accountNumber ?? "")"
        balanceDataLabel.text = "R$ \(user.account?.accountBalance ?? 0)"
        transactions = user.transactions ?? []
        tableView.reloadData()
    }
    
    func showUserDataFailure(message: String) {
        //logger.error("login failure: \(message)")
        //router?.showLogingFailure(message: message)
    }
}
