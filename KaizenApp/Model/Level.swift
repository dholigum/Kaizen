//
//  Level.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 30/04/21.
//

import Foundation

struct Level {
    let id: Int
    let xpToComplete: Int
    var xpNow: Int
    
    init(_ id: Int, xpToComplete: Int, xpNow: Int) {
        self.id = id
        self.xpToComplete = xpToComplete
        self.xpNow = xpNow
    }
    
    // Computed value
    var isComplete: Bool {
        if self.xpToComplete == self.xpNow {
            return true
        } else {
            return false
        }
    }
}
