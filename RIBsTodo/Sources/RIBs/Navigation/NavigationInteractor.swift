////
////  NavigationInteractor.swift
////  RIBsTodo
////
////  Created by Allie Kim on 2022/04/08.
////  Copyright © 2022 com.allieProject. All rights reserved.
////
//
//import RIBs
//import RxSwift
//
//protocol NavigationRouting: ViewableRouting {
//    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
//}
//
//protocol NavigationPresentable: Presentable {
//    var listener: NavigationPresentableListener? { get set }
//    // TODO: Declare methods the interactor can invoke the presenter to present data.
//}
//
//protocol NavigationListener: AnyObject {
//    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
//}
//
//final class NavigationInteractor: PresentableInteractor<NavigationPresentable>, NavigationInteractable, NavigationPresentableListener {
//
//    func didLogin(withEmail email: String, password: String) {
//        log.debug("didlogin", context: "NavigationInteractor")
//    }
//
//    weak var router: NavigationRouting?
//    weak var listener: NavigationListener?
//
//    // TODO: Add additional dependencies to constructor. Do not perform any logic
//    // in constructor.
//    override init(presenter: NavigationPresentable) {
//        super.init(presenter: presenter)
//        presenter.listener = self
//    }
//
//    override func didBecomeActive() {
//        super.didBecomeActive()
//        // TODO: Implement business logic here.
//    }
//
//    override func willResignActive() {
//        super.willResignActive()
//        // TODO: Pause any business logic.
//    }
//}
