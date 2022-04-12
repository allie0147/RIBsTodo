//
//  RootViewController.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import RIBs
import RxSwift
import SnapKit
import UIKit

protocol RootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UINavigationController, RootPresentable, RootViewControllable {
    func pop(viewController: ViewControllable, animation: Bool) {
        self.popViewController(animated: true)
    }


    func push(viewController: ViewControllable, animation: Bool) {
        self.pushViewController(viewController.uiviewController, animated: true)
    }




    weak var listener: RootPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    func replaceModal(viewController: ViewControllable) {
        targetViewController = viewController

        guard !animationInProgress else {
            return
        }

        if presentedViewController != nil {
            animationInProgress = true
            dismiss(animated: true) { [weak self] in
                if self?.targetViewController != nil {
                    self?.presentTargetViewController()
                } else {
                    self?.animationInProgress = false
                }
            }
        } else {
            presentTargetViewController()
        }
    }

    private var targetViewController: ViewControllable?
    private var animationInProgress = false

    private func presentTargetViewController() {
        if let targetViewController = targetViewController {
            animationInProgress = true
            targetViewController.uiviewController.modalPresentationStyle = .overCurrentContext
            present(targetViewController.uiviewController,
                    animated: true) { [weak self] in
                self?.animationInProgress = false
            }
        }
    }
}

extension RootViewController: LoggedInViewControllable {
}
