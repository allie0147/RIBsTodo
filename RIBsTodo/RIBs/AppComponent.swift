//
//  AppComponent.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/28.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
