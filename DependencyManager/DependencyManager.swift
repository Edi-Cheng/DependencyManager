//
//  DependencyManager.swift
//  DependencyManager
//
//  Created by Lin Cheng on 2021/6/14.
//

import Foundation

public class DependencyManager {
    
    private var dependencies = [String: Weak]()
    private static var shared = DependencyManager.init()
    
    private func register<T>(_ dependency: T) {
        let key = "\(type(of: T.self))"
        let weak = Weak.init(value: dependency as AnyObject)
        dependencies[key] = weak
    }
    
    private func resolve<T>() -> T {
        let key = "\(type(of: T.self))"
        
        let weak = dependencies[key]
        precondition(weak != nil, "No dependency found for  - \(key), Application must register a dependency before resolving it.")
        
        let dependency = weak!.value as? T
        precondition(dependency != nil, "No dependency found for  - \(key), Application must register a dependency before resolving it.")
        
        return dependency!
    }
    
    public static func register<T>(_ depndency: T) {
        shared.register(depndency)
    }
    
    public static func resolve<T>() -> T {
        shared.resolve()
    }
}
