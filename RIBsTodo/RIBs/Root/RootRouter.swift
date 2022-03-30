//
//  RootRouter.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import UIKit
import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        routeToLoggedOut()
    }

    // MARK: - Private
    private var loggedOutRouter: ViewableRouting?

    private let loggedOutBuilder: LoggedOutBuildable

    private func routeToLoggedOut() {
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouter = loggedOut
        attachChild(loggedOut)
        let navController = UINavigationController(root: loggedOut.viewControllable)

        viewController.replaceModal(viewController: navController)
    }
}
