//
//  LoggedInComponent+Main.swift
//  RIBsTodoTests
//
//  Created by Allie Kim on 2022/04/07.
//  Copyright © 2022 com.allieProject. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the Main scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyMain: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the Main scope.
}

extension LoggedInComponent: MainDependency {

    // TODO: Implement properties to provide for Main scope.
}
