////
////  NavigationRouter.swift
////  RIBsTodo
////
////  Created by Allie Kim on 2022/04/08.
////  Copyright © 2022 com.allieProject. All rights reserved.
////
//
//import RIBs
//
//protocol NavigationInteractable: Interactable, LoggedOutListener {
//    var router: NavigationRouting? { get set }
//    var listener: NavigationListener? { get set }
//}
//
//protocol NavigationViewControllable: ViewControllable {
//    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
//    func push(viewController: ViewControllable, animated: Bool)
//}
//
//final class NavigationRouter: LaunchRouter<NavigationInteractable, NavigationViewControllable>, NavigationRouting {
//
//    private let loggedOut: LoggedOutBuildable
//    private var loggedOutRouter: ViewableRouting?
//    // TODO: Constructor inject child builder protocols to allow building children.
//    init(interactor: NavigationInteractable,
//         viewController: NavigationViewControllable,
//         loggedOutBuilder: LoggedOutBuilder) {
//
//        self.loggedOut = loggedOutBuilder
//        super.init(interactor: interactor, viewController: viewController)
//        interactor.router = self
//    }
//
//    func routeToLoggedOut() {
//        let router = loggedOut.build(withListener: interactor)
//        loggedOutRouter = router
//        attachChild(router)
//
//        viewController.push(viewController: router.viewControllable, animated: true)
//    }
//}
