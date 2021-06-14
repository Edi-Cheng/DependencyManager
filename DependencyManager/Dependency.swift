//
//  Dependency.swift
//  DependencyManager
//
//  Created by Lin Cheng on 2021/6/14.
//

import Foundation

public protocol IsDependency: AnyObject {
    
}

@propertyWrapper
public class Dependency<T: IsDependency> {
    public unowned var wrappedValue: T
    
    public init() {
        self.wrappedValue = DependencyManager.resolve()
    }
}
