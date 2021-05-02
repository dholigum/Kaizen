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
    var quotes: String
    var author: String
    
    init(_ level: Int, xpToComplete: Int, xpNow: Int, quotes: String, author: String) {
        self.level = level
        self.xpToComplete = xpToComplete
        self.xpNow = xpNow
        self.quotes = quotes
        self.author = author
    }
}
