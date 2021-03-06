//
//  LoggedOutInteractor.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import RIBs
import RxSwift
import SwiftyBeaver

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func emptyInput()
    func validationFailed()
}

protocol LoggedOutListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func didLogin(withEmail email: String, password: String)
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }

    // MARK: - LoggedOutPresentableListener

    func login(withId id: String?, password: String?) {
        log.info("ID: \(id), PWD: \(password), login tapped")
        let idWithDefault = id ?? ""
        let passwordWithDefault = password ?? ""

        guard !idWithDefault.isEmpty,
            !passwordWithDefault.isEmpty else {
            self.presenter.emptyInput()
            return
        }

        // TODO: -regex

        listener?.didLogin(withEmail: id!, password: password!)
    }
}
