//
//  AlertViewController+UIViewContorller.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/04.
//

import UIKit

extension UIViewController {

    func showLoading() {
        DispatchQueue.main.async {
            AlertViewController.shared.showLoadingIndicator()
        }
    }

    func hideLoading() {
        AlertViewController.shared.hideLoadingIndicator()
    }
}
