//
//  LevelUpAlert.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 02/05/21.
//

import SwiftUI

struct LevelUpAlert: View {
    
    @StateObject var levelProgress = LevelViewModel()
    @Environment(\.managedObjectContext) var contextLevel
    @State var currentLevel = UserDefaults.standard.integer(forKey: "level")
    
    @Binding var nextLevelXPToComplete: Int
    @Binding var nextLevelStartingXP: Int
    
    var levelTask = LevelTask()
    
    var residualXP: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack {
                Image(systemName: "gamecontroller")
                    .foregroundColor(.white)
                    .font(Font.system(size: 24, weight: .regular))
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.top, 8)
                Text("Congratulations")
                    .font(.title)
                    .foregroundColor(.white)
                Text("You've Successfully Done The Work")
                    .foregroundColor(.white)
                
                Button(action: {}) {
                    Text("View in Badges")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(
                LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(25)
            
            Button(action: {
                self.currentLevel += 1
                UserDefaults.standard.set(self.currentLevel, forKey: "level")
                
                let nextLevel = currentLevel + 1
                
                nextLevelXPToComplete = levelTask.getCurrentLevelXPToComplete(nextLevel)
                nextLevelStartingXP = residualXP
                
                levelProgress.writeProgress(
                    detail: Level(nextLevel,
                                  xpToComplete: levelTask.getCurrentLevelXPToComplete(nextLevel),
                                  xpNow: residualXP),
                    context: contextLevel)
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .padding()
        }
        .shadow(radius: 4)
    }
}
