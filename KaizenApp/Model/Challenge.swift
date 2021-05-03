//
//  Challenge.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 03/05/21.
//

import Foundation

struct Challenge: Identifiable {
    let id = UUID()
    let difficulty: String
    let badgesImage: String
    let countToUnlock: Int
    let nickname: String
    
    init(_ difficulty: String, badgesImage: String, countToUnlock: Int, nickname: String) {
        self.difficulty = difficulty
        self.badgesImage = badgesImage
        self.countToUnlock = countToUnlock
        self.nickname = nickname
    }
}
