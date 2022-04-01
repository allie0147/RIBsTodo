//
//  RootComponent+LoggedIn.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/01.
//

import RIBs

/// The dependencies needed from the parent scope of Root to provide for the LoggedIn scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLoggedIn: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedIn scope.
}

extension RootComponent: LoggedInDependency {

    // TODO: Implement properties to provide for LoggedIn scope.
}
