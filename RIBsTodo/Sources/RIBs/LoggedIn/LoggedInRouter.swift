//
//  LoggedInRouter.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/01.
//

import RIBs
import UIKit

protocol LoggedInInteractable: Interactable, MainListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: NavigateViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
//    func replaceModal(viewController: ViewControllable)
    func push(viewController: ViewControllable, animation: Bool)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         mainBuilder: MainBuildable) {
        self.viewController = viewController
        self.mainBuilder = mainBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
        if let currentChild = currentChild {
//            viewController.popViewController(viewController: currentChild.viewControllable)
        }
    }

    override func didLoad() {
        super.didLoad()

        attachMain()
    }

    func routeToMain() {
        detachCurrentChild()
    }

    // MARK: - Private

    private let viewController: LoggedInViewControllable
    private let mainBuilder: MainBuildable

    private var currentChild: ViewableRouting?

    private func attachMain() {
        let main: MainRouting = mainBuilder.build(withListener: interactor)
        self.currentChild = main
        detachCurrentChild()
        attachChild(main)


        viewController.push(viewController: main.viewControllable, animation: true)
//        viewController.replaceRootNavigationViewController(root: main.viewControllable)

//        viewController.presentNavigationViewController(root: root.viewControllable)
//        viewController.pushViewController(viewController: main.viewControllable)

//        let navController = UINavigationController(root: main.viewControllable)
//        viewController.push(viewController: navController)
    }

    private func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.popViewController(viewController: currentChild.viewControllable)
//            viewController.popViewController(viewController: currentChild.viewControllable)
//            viewController.replaceModal(viewController: currentChild.viewControllable)
        }
    }
}
