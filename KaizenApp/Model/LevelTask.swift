//
//  LevelTask.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 30/04/21.
//

import Foundation

struct LevelTask {
    
    var levelingProgress: [Level] = levelData
    
    func getLevelList() -> [Level] {
        return levelingProgress
    }
    
    func getCurrentLevelXPToComplete(_ level: Int) -> Int {
        
        // Normalize level with the index array
        let levelIndex = level - 1
        
        if levelIndex > 10 {
            return levelingProgress[10].xpToComplete
        }
        
        return levelingProgress[levelIndex].xpToComplete
    }
    
    func getCurrentLevelQuotesCompletion(_ level: Int) -> (quote: String, author: String) {
        
        // Normalize level with the index array
        var levelIndex: Int
        
        if (level - 1) == -1 {
            levelIndex = 0
        } else if (level - 1) > 10 {
            levelIndex = 10
        } else {
            levelIndex = level
        }
        
        let qoute = levelingProgress[levelIndex].quotes
        let author = levelingProgress[levelIndex].author
        
        return (quote: qoute, author: author)
    }
    
    func getLevelDetail(_ level: Int) -> (level: Int, xpToComplete: Int, xpNow: Int) {
        
        var levelIndex: Int
        
        if level > 10 {
            levelIndex = 10
        } else {
            levelIndex = level
        }
        
        let levelNow = levelingProgress[levelIndex].level
        let xpToCompleteNow = levelingProgress[levelIndex].xpToComplete
        let xpNow = levelingProgress[levelIndex].xpNow
        
        return (level: levelNow, xpToComplete: xpToCompleteNow, xpNow: xpNow)
    }
}
