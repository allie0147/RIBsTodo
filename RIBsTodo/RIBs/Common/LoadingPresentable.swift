//
//  LoadingPresentable.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/29.
//

import UIKit

protocol LoadingPresentable: AnyObject {
    func showLoading(with status: String?)
    func showSuccess(with status: String?)
    func showError(with status: String?)

    func hideLoading()
}

extension UIViewController: LoadingPresentable {
    func showLoading(with status: String?) {
    }

    func showSuccess(with status: String?) {
    }

    func showError(with status: String?) {
    }

    func hideLoading() {
    }
}
