//
//  Weak.swift
//  DependencyManager
//
//  Created by Lin Cheng on 2021/6/14.
//

import Foundation

class Weak: Equatable {
    
    weak var value: AnyObject?
    
    init(value: AnyObject) {
        self.value = value
    }
    
    static func == (lhs: Weak, rhs: Weak) -> Bool {
        return lhs.value === rhs.value
    }
}
