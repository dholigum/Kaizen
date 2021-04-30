//
//  Level.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 30/04/21.
//

import Foundation

struct Level {
    let level: Int
    let xpToComplete: Int
    var xpNow: Int
    
    init(_ level: Int, xpToComplete: Int, xpNow: Int) {
        self.level = level
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
