////
////  NavigationBuilder.swift
////  RIBsTodo
////
////  Created by Allie Kim on 2022/04/08.
////  Copyright © 2022 com.allieProject. All rights reserved.
////
//
//import RIBs
//
//protocol NavigationDependency: Dependency {
//    // TODO: Declare the set of dependencies required by this RIB, but cannot be
//    // created by this RIB.
//}
//
//final class NavigationComponent: Component<NavigationDependency> {
//
//    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
//}
//
//// MARK: - Builder
//
//protocol NavigationBuildable: Buildable {
//    func build(withListener listener: NavigationListener) -> NavigationRouting
//}
//
//final class NavigationBuilder: Builder<NavigationDependency>, NavigationBuildable {
//
//    override init(dependency: NavigationDependency) {
//        super.init(dependency: dependency)
//    }
//
//    func build(withListener listener: NavigationListener) -> NavigationRouting {
//        let component = NavigationComponent(dependency: dependency)
//        let viewController = NavigationViewController()
//        let interactor = NavigationInteractor(presenter: viewController)
//        interactor.listener = listener
//        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
//
//        return NavigationRouter(
//            interactor: interactor,
//            viewController: viewController,
//            loggedOutBuilder: loggedOutBuilder
//        )
//    }
//}
