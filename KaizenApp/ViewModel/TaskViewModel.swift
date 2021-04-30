//
//  TaskViewModel.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var difficulty = ""
    
    var xp: Int {
        switch difficulty {
        case "Easy":
            return 50
        case "Medium":
            return 100
        case "Hard":
            return 150
        case "Insane":
            return 200
        default:
            return 0
        }
    }
    
    // For NewData sheet
    @Published var isNewData = false
    @Published var isPresentedBadgesView = false
    @Published var isPresentedArchiveView = false
    
    // Storing Update Item ...
    @Published var updateItem: Task!
    
    func selectDifficulty(value: String) {
        difficulty = value
    }
    
    func getStickyColor(difficulty: String) -> String {
        switch difficulty {
        case "Easy":
            return "greencolor"
        case "Medium":
            return "maincolor2"
        case "Hard":
            return "orangecolor"
        case "Insane":
            return "redcolor"
        default:
            return "maincolor2"
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        
        if updateItem != nil {
            // Update old data ...
            updateItem.date = date
            updateItem.title = title
            updateItem.difficulty = difficulty
            updateItem.xp = Int32(xp)
            
            try! context.save()
            
            // Removing updatingItem if successfull
            updateItem = nil
            isNewData.toggle()
            title = ""
            difficulty = ""
            date = Date()
            
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.title = title
        newTask.difficulty = difficulty
        newTask.xp = Int32(xp)
        
        // Saving data ...
        do {
            try context.save()
            
            // Closing view when success
            isNewData.toggle()
            title = ""
            difficulty = ""
            date = Date()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editItem(item: Task) {
        updateItem = item
        
        // Togging the newDataView ...
        date = item.date!
        title = item.title!
        difficulty = item.difficulty!
        isNewData.toggle()
    }
    
}
