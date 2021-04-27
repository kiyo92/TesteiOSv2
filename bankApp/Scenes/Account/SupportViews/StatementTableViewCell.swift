//
//  StatementTableViewCell.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit
import SnapKit
class StatementTableViewCell: UITableViewCell {
    
    private var accountInfoContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 7
        view.layer.cornerRadius = 10
        return view
    }()
    
    private var transactionTypeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "Pagamento"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        return label
    }()
    
    private var transactionDescriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Conta de luz"
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        return label
    }()
    
    private var transactionDateLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "12/12/2019"
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        return label
    }()
    
    private var transactionValueLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "R$ 1000,00"
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        return label
    }()
    
    func setup(){
        
        contentView.addSubview(accountInfoContainer)
        accountInfoContainer.addSubview(transactionTypeLabel)
        accountInfoContainer.addSubview(transactionDescriptionLabel)
        accountInfoContainer.addSubview(transactionDateLabel)
        accountInfoContainer.addSubview(transactionValueLabel)
        
        accountInfoContainer.snp.makeConstraints(){ make in
            make.top.equalToSuperview().inset(5)
            make.trailing.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(20)
        }
        
        transactionTypeLabel.snp.makeConstraints(){ make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalTo(accountInfoContainer.snp.centerX)
            
        }
        
        transactionDateLabel.snp.makeConstraints(){ make in
            make.centerY.equalTo(transactionTypeLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(accountInfoContainer.snp.centerX)
        }
        
        transactionDescriptionLabel.snp.makeConstraints(){ make in
            make.top.equalTo(transactionTypeLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalTo(accountInfoContainer.snp.centerX)
        }
        
        transactionValueLabel.snp.makeConstraints(){ make in
            make.centerY.equalTo(transactionDescriptionLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(accountInfoContainer.snp.centerX)
        }
    }

}
