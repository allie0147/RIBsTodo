//
//  LoadingPresentable.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/29.
//

import Foundation

protocol AlertPresentable: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showSuccess(with status: String?)
    func showError(with status: String?)
}
