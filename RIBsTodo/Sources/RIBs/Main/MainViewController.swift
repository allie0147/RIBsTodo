//
//  MainViewController.swift
//  RIBsTodoTests
//
//  Created by Allie Kim on 2022/04/07.
//  Copyright © 2022 com.allieProject. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {
    weak var listener: MainPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }
}
