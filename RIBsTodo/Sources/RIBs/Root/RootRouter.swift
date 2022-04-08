//
//  RootRouter.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import UIKit
import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: NavigateViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
//    func replaceModal(viewController: ViewControllable)
    func push(viewController: ViewControllable, animation: Bool)
    func pop(viewController: ViewControllable, animation: Bool)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable,
         loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder

        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        routeToLoggedOut()
    }

    func routeToLoggedIn(email: String, password: String) {
//        if let loggedOut = loggedOutRouter {
//            detachChild(loggedOut)
//            viewController.popViewController(viewController: loggedOut.viewControllable)
//            self.loggedOutRouter = nil
//        }
        let loggedIn = loggedInBuilder.build(
            withListener: interactor,
            email: email,
            password: password
        )
        attachChild(loggedIn)
    }

    // MARK: - Private
    private var loggedOutRouter: ViewableRouting?

    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable

    private func routeToLoggedOut() {
//        routeToLoggedOutController()
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouter = loggedOut
        attachChild(loggedOut)
//        viewController.pushViewController(viewController: loggedOut.viewControllable)
        viewController.push(viewController: loggedOut.viewControllable, animation: true)
//        viewController.presentNavigationViewController(root: self.viewControllable)
//        viewController.presentNavigationViewController(root: loggedOut.viewControllable)
//        viewController.pushViewController(viewController: loggedOut.viewControllable)

//        viewController.replaceModal(viewController: loggedOut.viewControllable)
//        let navController = UINavigationController(root: loggedOut.viewControllable)
//        viewController.replaceModal(viewController: navController)
    }

    private var window: UIWindow? {
        return UIApplication.shared.keyWindow
    }

//    func routeToOnboarding() {
//        window?.rootViewController = OnboardingViewController
//    }
//
//    func routeToHomeTabbar() {
//        window?.rootViewController = HomeTabbarViewController
//    }

    func routeToLoggedOutController() {
        window?.rootViewController = LoggedOutViewController()
    }
}
