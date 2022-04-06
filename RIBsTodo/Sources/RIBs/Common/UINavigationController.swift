//
//  UINavigationController.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/29.
//

import UIKit
import RIBs

extension UINavigationController: ViewControllable {
    public var uiviewController: UIViewController { return self }

    public convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
}
