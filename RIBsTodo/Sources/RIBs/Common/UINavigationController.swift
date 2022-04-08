//
//  UINavigationController.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/29.
//

import UIKit
import RIBs

//extension UINavigationController: ViewControllable {
//    public var uiviewController: UIViewController { return self }
//
//    public convenience init(root: ViewControllable) {
//        self.init(rootViewController: root.uiviewController)
//    }
//}

protocol NavigateViewControllable: ViewControllable {
    func presentViewController(viewController: ViewControllable)
//    func presentNavigationViewController(root: ViewControllable)
    func dismissViewController(viewController: ViewControllable)
    func pushViewController(viewController: ViewControllable)
    func popViewController(viewController: ViewControllable)
    func replaceRootNavigationViewController(root: ViewControllable)
}

extension NavigateViewControllable {
    func presentViewController(viewController: ViewControllable) {
        uiviewController.present(viewController.uiviewController, animated: true, completion: nil)
    }
//    func presentNavigationViewController(root: ViewControllable) {
//        let navi = UINavigationController(root: root)
//        navi.modalPresentationStyle = .overCurrentContext
//        uiviewController.present(navi.uiviewController, animated: true, completion: nil)
//    }
    func dismissViewController(viewController: ViewControllable) {
        viewController.uiviewController.dismiss(animated: true, completion: nil)
    }
    func pushViewController(viewController: ViewControllable) {
        log.debug("uiviewController \(uiviewController)", context: nil)
        uiviewController.navigationController?.pushViewController(viewController.uiviewController, animated: true)
    }
    func popViewController(viewController: ViewControllable) {
        uiviewController.navigationController?.popToViewController(viewController.uiviewController, animated: false)
    }
    func replaceRootNavigationViewController(root: ViewControllable) {
        let navi = UINavigationController(rootViewController: root.uiviewController)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navi
        window.makeKeyAndVisible()
    }
}
