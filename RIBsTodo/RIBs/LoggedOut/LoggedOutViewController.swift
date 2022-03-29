//
//  LoggedOutViewController.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
}
