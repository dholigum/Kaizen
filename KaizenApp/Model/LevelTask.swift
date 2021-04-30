//
//  LevelTask.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 30/04/21.
//

import Foundation

struct LevelTask {
    var levelingProgress = [
        Level(1, xpToComplete: 300, xpNow: 0),
        Level(2, xpToComplete: 700, xpNow: 0),
        Level(3, xpToComplete: 1500, xpNow: 0),
        Level(4, xpToComplete: 3000, xpNow: 0),
        Level(5, xpToComplete: 7000, xpNow: 0),
        Level(6, xpToComplete: 10000, xpNow: 0),
        Level(7, xpToComplete: 15000, xpNow: 0),
        Level(8, xpToComplete: 24000, xpNow: 0),
        Level(9, xpToComplete: 36000, xpNow: 0),
        Level(10, xpToComplete: 50000, xpNow: 0)
    ]
    
    var levelIndex = 0
    
    mutating func updateXPNow(value: Int) {
        
        // Update xpNow with value
        levelingProgress[levelIndex].xpNow = value
    }
    
    mutating func nextLevel(to newLevel: Int) {
        
        // Update current level
        levelIndex = newLevel - 1
    }
    
    func getLevelDetail() -> (level: Int, xpToComplete: Int, xpNow: Int) {
        
        let levelNow = levelingProgress[levelIndex].level
        let xpToCompleteNow = levelingProgress[levelIndex].xpToComplete
        let xpNow = levelingProgress[levelIndex].xpNow
        
        return (level: levelNow, xpToComplete: xpToCompleteNow, xpNow: xpNow)
    }
}
