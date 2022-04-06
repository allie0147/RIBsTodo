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

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
    func present(viewController: ViewControllable)
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

    func routeToLoggedIn() {
        if let loggedOut = loggedOutRouter {
            detachChild(loggedOut)
            viewController.dismiss(viewController: loggedOut.viewControllable)
            self.loggedOutRouter = nil
        }
        let loggedIn = loggedInBuilder.build(withListener: interactor)
        attachChild(loggedIn)
    }

    // MARK: - Private
    private var loggedOutRouter: ViewableRouting?

    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable

    private func routeToLoggedOut() {
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouter = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
//        let navController = UINavigationController(root: loggedOut.viewControllable)
//
//        viewController.replaceModal(viewController: navController)
    }

}
