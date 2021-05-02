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
            VStack(alignment: .center) {
                ZStack {
                    Image("congrats-ribbon")
                        .resizable()
                        .frame(width: 70, height: 60, alignment: .center)
                        .padding(.top, -16)
                    Text("\(currentLevel + 1)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("yellowcolor"))
                        .padding(.bottom, 28)
                }
                Text("Congratulations!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, -16)
                Text("You've Successfully Done The Work")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                Text("-")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                Text("\"\(levelTask.getCurrentLevelQuotesCompletion(currentLevel).quote)\"")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .italic()
                    .foregroundColor(.white)
                    .frame(width: 320, height: 60, alignment: .center)
                    .multilineTextAlignment(.center)
                Text("- \(levelTask.getCurrentLevelQuotesCompletion(currentLevel).author)")
                    .font(.footnote)
                    .fontWeight(.light)
                    .italic()
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Button(action: {}) {
                    Text("View in Badges")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
                .padding(.bottom, -16)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 10)
            .background(
                LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(16)
            
            Button(action: {
                self.currentLevel += 1
                UserDefaults.standard.set(self.currentLevel, forKey: "level")
                
                let nextLevel = currentLevel + 1
                
                nextLevelXPToComplete = levelTask.getCurrentLevelXPToComplete(nextLevel)
                nextLevelStartingXP = residualXP
                
                levelProgress.writeProgress(
                    detail: Level(nextLevel,
                                  xpToComplete: levelTask.getCurrentLevelXPToComplete(nextLevel),
                                  xpNow: residualXP,
                                  quotes: levelTask.getCurrentLevelQuotesCompletion(currentLevel).quote,
                                  author: levelTask.getCurrentLevelQuotesCompletion(currentLevel).author),
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
