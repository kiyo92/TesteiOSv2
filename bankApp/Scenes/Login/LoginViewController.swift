//
//  LoginViewController.swift
//  bankApp
//
//  Created by Joao Marcus Dionisio Araujo on 25/04/21.
//

import UIKit
import SnapKit
protocol LoginViewControllerInput: AnyObject {
    func showLogingSuccess(username: String)
    func showLogingFailure(message: String)
}

protocol LoginViewControllerOutput: AnyObject {
    func tryToLogIn()
}

final class LoginViewController: UIViewController {
    var interactor: LoginInteractorInput?
    var router: LoginRouting?
    
    private var loginButton: UIButton = {
        let btn = UIButton(frame: CGRect.zero)
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.2862745098, blue: 0.9333333333, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private var logoContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.2862745098, blue: 0.9333333333, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    private var logoLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Bank"
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 35)
        return label
    }()
    
    private var loginTextField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: "HelveticaNeue", size: 18)
        textfield.placeholder = "User"
        textfield.borderStyle = UITextField.BorderStyle.roundedRect
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: "HelveticaNeue", size: 18)
        textfield.placeholder = "Password"
        textfield.borderStyle = UITextField.BorderStyle.roundedRect
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupUI()
    }
}

private extension LoginViewController {
    func setupUI() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupLogo()
        setupLoginButton()
    }
    
    func setupLogo(){
        view.addSubview(logoContainer)
        logoContainer.addSubview(logoLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        logoContainer.snp.makeConstraints(){make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(56)
            make.centerX.equalToSuperview()
            make.width.equalTo(125)
            make.height.equalTo(70)
        }
        logoLabel.snp.makeConstraints(){make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }
        loginTextField.snp.makeConstraints(){make in
            make.top.equalTo(logoContainer.snp.bottom).offset(105)
            make.leading.trailing.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints(){make in
            make.top.equalTo(loginTextField.snp.bottom).offset(21)
            make.leading.trailing.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
    }
    
    func setupLoginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints(){make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).inset(33)
            make.centerX.equalToSuperview()
            make.width.equalTo(202)
            make.height.equalTo(62)
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    @objc func loginButtonAction() {
        interactor?.tryToLogIn()
        
    }
}

extension LoginViewController: LoginViewControllerInput {
    func showLogingSuccess(username: String) {
        print("logged: \(username)")
        router?.showLoginSuccess()
    }
    
    func showLogingFailure(message: String) {
        let action = UIAlertAction(title: "OK", style: .destructive)
        let alertController = UIAlertController(title: "Login Failure",
                                message: message,
                                preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
