//
//  LoggedOutViewController.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import RIBs
import RxSwift
import Then
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(idUnderView)
        view.addSubview(passwordUnderView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.leading.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }

        idUnderView.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(1)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idUnderView.snp.bottom).offset(10)
            $0.leading.trailing.height.centerX.equalTo(idTextField)
        }

        passwordUnderView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.leading.trailing.height.equalTo(idUnderView)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordUnderView.snp.bottom).offset(40)
            $0.leading.trailing.height.centerX.equalTo(idTextField)
        }
    }

    // MARK: - Private
    private let idTextField = UITextField().then {
        $0.becomeFirstResponder()
        $0.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        $0.placeholder = "Id"
    }

    private let idUnderView = UIView().then {
        $0.backgroundColor = .black
    }

    private let passwordTextField = UITextField().then {
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        $0.placeholder = "Password"
    }

    private let passwordUnderView = UIView().then {
        $0.backgroundColor = .black
    }

    private let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Login", for: .normal)
    }
}
