//
//  LoggedInBuilder.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/01.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var loggedInViewController: LoggedInViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class LoggedInComponent: Component<LoggedInDependency> {

//    Component 개념: Builder.swift에 있는 (p)Dependency와 Component 사용처
//    (p)Dependency는 ParentComponent+ChildDependency와 연관이 있으며, parent의 Component에 있는 값을 전달할 때 사용
//    Component 클래스에만 의존성 정의하는 경우: Parent의 Component에는 존재하지 않지만 새로운 데이터를 받고싶은 경우 사용

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.

    fileprivate let userEmail: String
    fileprivate let userPassword: String

    init(
        dependency: LoggedInDependency,
        email userEmail: String,
        password userPassword: String
    ) {
        self.userEmail = userEmail
        self.userPassword = userPassword
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(
        withListener listener: LoggedInListener,
        email userEmail: String,
        password userPassword: String
    ) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(
        withListener listener: LoggedInListener,
        email userEmail: String,
        password userPassword: String
    ) -> LoggedInRouting {
        let component = LoggedInComponent(
            dependency: dependency,
            email: userEmail,
            password: userPassword
        )

        let interactor = LoggedInInteractor()
        interactor.listener = listener

        let mainBuilder = MainBuilder(dependency: component)

        return LoggedInRouter(
            interactor: interactor,
            viewController: component.loggedInViewController,
            mainBuilder: mainBuilder
        )
    }
}
