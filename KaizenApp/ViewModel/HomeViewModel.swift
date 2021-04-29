//
//  HomeViewModel.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var difficulty = ""
    
    // For NewData sheet
    @Published var isNewData = false
    
    func selectDifficulty(value: String) {
        difficulty = value
    }
    
    func getExperiencePoint(difficulty: String) -> Int {
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
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.title = title
        newTask.difficulty = difficulty
        
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
    
}
