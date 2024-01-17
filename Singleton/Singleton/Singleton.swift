//
//  Singleton.swift
//  Singleton
//
//  Created by white4ocolate on 15.01.2024.
//

import Foundation

class Safe {
    var money = 0
    static let shared = Safe()
    
    private init() {}
}
