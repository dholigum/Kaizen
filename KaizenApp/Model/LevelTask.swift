//
//  LevelTask.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 30/04/21.
//

import Foundation

struct LevelTask {
    var levelingProgress = [
        Level(1, xpToComplete: 300, xpNow: 0, quotes: "A man begins every stage of his life as a novice", author: "Nicolas Chamfort"),
        Level(2, xpToComplete: 700, xpNow: 0, quotes: "The expert at anything was once a beginner.", author: "Helen Hayes"),
        Level(3, xpToComplete: 1500, xpNow: 0, quotes: "You don't have to go fast, You just have to go", author: "T. Harv Eker"),
        Level(4, xpToComplete: 3000, xpNow: 0, quotes: "Hard work is a two way street, You get back exactly what you put in", author: "Kashyap Upadaya"),
        Level(5, xpToComplete: 7000, xpNow: 0, quotes: "Ambition is the path to success. Persistence is the vehicle you arrive in", author: "Bill Bradley"),
        Level(6, xpToComplete: 10000, xpNow: 0, quotes: "It's only those who are presistent and willing to study things deeply, Who achieve the master work", author: "Paulo Coelho"),
        Level(7, xpToComplete: 15000, xpNow: 0, quotes: "Grit is living life like it's a marathon, not a sprint", author: "Angela Duckworth"),
        Level(8, xpToComplete: 24000, xpNow: 0, quotes: "True grit is making a decision and standing by it, Doing what must be done", author: "John Wayne"),
        Level(9, xpToComplete: 36000, xpNow: 0, quotes: "By learning you will teach, by teaching you will learn", author: "Latin Proverb"),
        Level(10, xpToComplete: 50000, xpNow: 0, quotes: "Once you stop learning, You start dying", author: "Albert Einstein"),
        Level(11, xpToComplete: 9999999, xpNow: 0, quotes: "Live as if you were to die tomorrow, Learn as if you were to live forever", author: "Mahatma Gandhi")
    ]
    
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
