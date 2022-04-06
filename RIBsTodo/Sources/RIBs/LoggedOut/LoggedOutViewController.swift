//
//  LoggedOutViewController.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import RIBs
import RxCocoa
import RxSwift
import Then
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login(withId id: String?, password: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(idUnderView)
        view.addSubview(passwordUnderView)

        bindUI()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        bindLayout()
    }

    // MARK: - LoggedOutPresentable

    func emptyInput() {
        log.verbose("Empty input")
        showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3,
                                      execute: { [weak self] in
                                          self?.hideLoading()
                                      })
    }

    func validationFailed() {
        log.verbose("Validation Failed")
    }

    // MARK: - Private
    private let idTextField = UITextField().then {
        $0.becomeFirstResponder()
        $0.keyboardType = .emailAddress
        $0.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        $0.placeholder = "Id"
    }

    private let idUnderView = UIView().then {
        $0.backgroundColor = .black
    }

    private let passwordTextField = UITextField().then {
        $0.returnKeyType = .done
        $0.keyboardType = .alphabet
        $0.isSecureTextEntry = true
        $0.enablesReturnKeyAutomatically = true
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        $0.placeholder = "Password"
    }

    private let passwordUnderView = UIView().then {
        $0.backgroundColor = .black
    }

    private let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .systemPurple
        $0.layer.cornerRadius = 5
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Login", for: .normal)
    }

    private let disposeBag = DisposeBag()

    private func bindLayout() {
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

    private func bindUI() {
        didTapLoginButton()
        dismissKeyboard()
        didTapReturnKeyboard()
    }

    private func didTapLoginButton() {
        loginButton.rx.tap
            .bind(
            onNext: { [weak self] in
                guard let `self` = self else {
                    return
                }
                guard let listener = self.listener else {
                    return
                }
                self.view.endEditing(true)
                listener.login(
                    withId: self.idTextField.text,
                    password: self.passwordTextField.text
                )
            })
            .disposed(by: disposeBag)
    }

    private func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        tapGesture.rx.event
            .bind(onNext: { [weak self] _ in
            self?.view.endEditing(true)
        }).disposed(by: disposeBag)
    }

    private func didTapReturnKeyboard() {
        idTextField.rx
            .controlEvent(.editingDidEndOnExit)
            .bind(
            onNext: { [weak self] _ in
                self?.passwordTextField.becomeFirstResponder()
            })
            .disposed(by: disposeBag)

        passwordTextField.rx
            .controlEvent(.editingDidEndOnExit)
            .bind(
            onNext: { [weak self] _ in
                self?.didTapLoginButton()
            })
            .disposed(by: disposeBag)
    }
}
