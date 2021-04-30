//
//  LevelViewModel.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 30/04/21.
//

import SwiftUI
import CoreData

class LevelViewModel: ObservableObject {
    @Published var level = 0
    @Published var xpNow = 0
    @Published var xpToComplete = 0
    
    func writeProgress(detail: Level, context: NSManagedObjectContext) {
        
        // Populate with progress from completed task
        level = detail.level
        xpNow = detail.xpNow
        xpToComplete = detail.xpToComplete
        
        let newProgress = Progress(context: context)
        newProgress.level = Int16(level)
        newProgress.xpNow = Int32(xpNow)
        newProgress.xpToComplete = Int32(xpToComplete)
        
        // Saving data ...
        do {
            try context.save()
            
            // Closing view when success
            level = 0
            xpNow = 0
            xpToComplete = 0
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
