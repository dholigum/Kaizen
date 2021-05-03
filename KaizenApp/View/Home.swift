//
//  Home.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI
import CoreData

struct Home: View {
    
    @State var currentLevel = UserDefaults.standard.integer(forKey: "level")
    
    // State to read value from LevelUp Alert
    @State var nextLevelXPToComplete = 0
    @State var nextLevelStartingXP = 0
    
    // State object from viewModel
    @StateObject var homeData = TaskViewModel()
    @StateObject var levelProgress = LevelViewModel()
    
    // Fetching Data ...
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var tasks : FetchedResults<Task>
    @FetchRequest(entity: Progress.entity(), sortDescriptors: [NSSortDescriptor(key: "level", ascending: true)], animation: .spring()) var progress : FetchedResults<Progress>
    
    // For Saving and Deleting Data ...
    @Environment(\.managedObjectContext) var contextTask
    @Environment(\.managedObjectContext) var contextLevel
    
    var levelTask = LevelTask()
    
    // Computed properties
    var sumXP: Int {
        Int(tasks.reduce(0) { $0 + $1.xp })
    }
    var currentXP: Int {
        Int(progress
                .filter { $0.level == currentLevel + 1 }
                .reduce(0) { $0 + $1.xpNow })
    }
    var currentXPToComplete: Int {
        Int(progress.last?.xpToComplete ?? 1)
    }
    var levelPercentage: CGFloat {
        CGFloat(progress
                    .filter { $0.level == currentLevel + 1 }
                    .reduce(0) { $0 + $1.xpNow })
                / CGFloat(progress.last?.xpToComplete ?? 1)
    }
    var residualXP: Int {
        Int(progress
                .filter { $0.level == currentLevel + 1 }
                .reduce(0) { $0 + $1.xpNow }) - Int(CGFloat(progress.last?.xpToComplete ?? 1))
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                    RoundedRectangle(cornerRadius: 16)
                        .gradientForeground(colors: [Color("maincolor"), Color("maincolor2")])
                        .frame(height: 200)
                    HStack {
                        ZStack {
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(Color("accentcolor"), lineWidth: 10)
                                .frame(width: 80, height: 80)
                                .padding(.leading, 28)
                                .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + CGFloat(8))
                            
                            Circle()
                                .trim(from: 0, to: nextLevelXPToComplete == 0 ? levelPercentage : CGFloat(nextLevelStartingXP) / CGFloat(nextLevelXPToComplete))
                                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.black)
                                .rotationEffect(Angle(degrees: 270))
                                .frame(width: 80, height: 80)
                                .padding(.leading, 28)
                                .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + CGFloat(8))
                        }
                        
                        VStack(alignment: .leading, spacing: nil, content: {
                            HStack {
                                Text("Level \(nextLevelXPToComplete == 0 ? levelTask.getLevelDetail(currentLevel).level : levelTask.getLevelDetail(currentLevel).level + 1)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                                Button(action: {homeData.isPresentedBadgesView.toggle()}, label: {
                                    Image(systemName: "star.circle")
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 30, weight: .regular))
                                        .padding(.all, 8)
                                        .padding(.top, 2)
                                })
//                                Button(action: {homeData.isPresentedArchiveView.toggle()}, label: {
//                                    Image(systemName: "archivebox.circle")
//                                        .foregroundColor(.white)
//                                        .font(Font.system(size: 30, weight: .regular))
//                                        .padding(.trailing, 8)
//                                        .padding(.top, 2)
//                                })
                            }
                            Text("\(nextLevelXPToComplete == 0 ? currentXP : nextLevelStartingXP) / \(currentXPToComplete == 1 ? levelTask.getLevelDetail(currentLevel).xpToComplete : currentXPToComplete) XP")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .padding(.top, -16)
                                .padding(.bottom, 2)
                            HStack {
                                Text("💡 ")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                    .padding(.trailing, -8)
                                Text("\(sumXP != 0 ? "Finish more tasks to gain more \(sumXP) experience points" : "Create new task to gain additional experience points")")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                            }
                            .padding(.leading, -4)
                        })
                        .padding()
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    }
                })
                
                HStack {
                    Text("Your Tasks")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.bottom, -16)
                .background(Color("accentcolor"))
                
                // Empty View ...
                if tasks.isEmpty {
                    Spacer()
                    Text("📭")
                        .font(.system(size: 80))
                        .foregroundColor(.black)
                    Text("No tasks yet …")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text("Create a new task and it will show up here")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                    Spacer()
                    
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(tasks) { task in
                                HStack {
                                    RoundedRectangle(cornerRadius: 2.5)
                                        .foregroundColor(Color("\(homeData.getStickyColor(difficulty: task.difficulty ?? "maincolor"))"))
                                        .frame(width: 5, height: 42, alignment: .leading)
                                        .padding(.leading, 8)
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text("\(task.title ?? "")")
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Text("\(task.xp) XP")
                                                .font(.subheadline)
                                                .fontWeight(.light)
                                                .padding(.trailing, 12)
                                                .foregroundColor(.black)
                                        }
                                        
                                        Text("\(task.date?.getFormattedDateString(format: "EEEE, MMM d, yyyy") ?? Date().getFormattedDateString(format: "EEEE, MMM d, yyyy"))")
                                            .font(.footnote)
                                            .fontWeight(.light)
                                            .foregroundColor(.black)
                                    }
                                }
                                .frame(width: 360, height: 60, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(8)
                                .contextMenu(ContextMenu(menuItems: {
                                    Button(action: {homeData.editItem(item: task)}, label: {
                                        Label(
                                            title: { Text("Edit") },
                                            icon: { Image(systemName: "square.and.pencil") }
                                        )
                                    })
                                    
                                    Button(action: {
                                        contextTask.delete(task)
                                        try! contextTask.save()
                                    }, label: {
                                        Label(
                                            title: { Text("Delete") },
                                            icon: { Image(systemName: "multiply") }
                                        )
                                    })
                                    
                                    Button(action: {
                                        contextTask.delete(task)
                                        
                                        var xpToCompleteCurrentLevel = levelTask.getLevelDetail(currentLevel).xpToComplete
                                        let currentQuotesCompletion = levelTask.getCurrentLevelQuotesCompletion(currentLevel)
                                    
                                        if currentXP >= xpToCompleteCurrentLevel {
                                            self.currentLevel += 1
                                            UserDefaults.standard.set(self.currentLevel, forKey: "level")
                                            
                                            xpToCompleteCurrentLevel = levelTask.getLevelDetail(currentLevel).xpToComplete
                                        }
                                        
                                        levelProgress.writeProgress(
                                            detail: Level(currentLevel + 1,
                                                          xpToComplete: xpToCompleteCurrentLevel,
                                                          xpNow: Int(task.xp),
                                                          quotes: currentQuotesCompletion.quote,
                                                          author: currentQuotesCompletion.author),
                                            context: contextLevel)
                                        
                                        try! contextTask.save()
                                        
                                        // Reset this temporary value back
                                        nextLevelXPToComplete = 0
                                        nextLevelStartingXP = 0
                                        
                                    }, label: {
                                        Label(
                                            title: { Text("Mark as Done") },
                                            icon: { Image(systemName: "checkmark") }
                                        )
                                    })
                                }))
                            }
                        }
                        .padding()
                    })
                    .background(Color("accentcolor"))
                }
            }
            
            // Add button
            Button(action: {homeData.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(Font.system(size: 40, weight: .regular))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
                    )
                    .clipShape(Circle())
            })
            .padding(.trailing)
            
            // Show Level Up Alert
            if  (nextLevelXPToComplete == 0 ? levelPercentage : CGFloat(nextLevelStartingXP) / CGFloat(nextLevelXPToComplete)) >= 1 {
                
                LevelUpAlert(nextLevelXPToComplete: $nextLevelXPToComplete, nextLevelStartingXP: $nextLevelStartingXP, residualXP: residualXP)
                    .frame(width: UIScreen.main.bounds.size.width - 60, height: UIScreen.main.bounds.size.width - 120, alignment: .center)
                    .alignmentGuide(.trailing, computeValue: { dimension in
                        dimension[HorizontalAlignment.trailing] + 28
                    })
                    .alignmentGuide(.bottom, computeValue: { _ in
                        (UIScreen.main.bounds.size.height / 2) + 40
                    })
            }
            
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.isNewData, content: {
            TaskModal(homeData: homeData)
        })
        .sheet(isPresented: $homeData.isPresentedBadgesView, content: {
            Badges(homeData: homeData)
        })
        .sheet(isPresented: $homeData.isPresentedArchiveView, content: {
            Archive(homeData: homeData)
        })
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(gradient: .init(colors: colors),
                           startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}

extension Date {
    func getFormattedDateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
    }
}
