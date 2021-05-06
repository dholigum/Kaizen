//
//  Badges.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct Badges: View {
    
    @ObservedObject var homeData = TaskViewModel()
    @State var currentLevel = UserDefaults.standard.integer(forKey: "level")
    @State var showLevelBadgesDetail = false
    @State var levelSelected: Int = 1
    
    @FetchRequest(entity: Progress.entity(), sortDescriptors: [NSSortDescriptor(key: "level", ascending: true)], predicate: NSPredicate(format: "xpNow == %@", "50")) var easyTasks : FetchedResults<Progress>
    @FetchRequest(entity: Progress.entity(), sortDescriptors: [NSSortDescriptor(key: "level", ascending: true)], predicate: NSPredicate(format: "xpNow == %@", "100")) var normalTasks : FetchedResults<Progress>
    @FetchRequest(entity: Progress.entity(), sortDescriptors: [NSSortDescriptor(key: "level", ascending: true)], predicate: NSPredicate(format: "xpNow == %@", "150")) var hardTasks : FetchedResults<Progress>
    @FetchRequest(entity: Progress.entity(), sortDescriptors: [NSSortDescriptor(key: "level", ascending: true)], predicate: NSPredicate(format: "xpNow == %@", "200")) var insaneTasks : FetchedResults<Progress>
    
    var levels: [Level] = levelData
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.leading, -16)
                    .padding(.top, 8)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    Color(.white)
                    
                    VStack(alignment: .leading) {
                        Text("Level Accomplishment")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            LazyHStack(spacing: 16) {
                                ForEach(levels) { item in
                                    
                                    Button(action: {
                                        if item.level <= currentLevel {
                                            withAnimation {
                                                showLevelBadgesDetail.toggle()
                                                levelSelected = item.level
                                            }
                                        } else {
                                            return
                                        }
                                    }, label: {
                                        if item.level <= currentLevel {
                                            VStack {
                                                ZStack {
                                                    Image("congrats-ribbon")
                                                        .resizable()
                                                        .frame(width: 50, height: 45, alignment: .center)

                                                    Text("\(item.level)")
                                                        .font(.title)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color("yellowcolor"))
                                                        .padding(.bottom, 10)
                                                }
                                                Text("Level \(item.level) Complete")
                                                    .font(.system(size: 8))
                                                    .foregroundColor(.white)
                                            }
                                            .frame(width: 85, height: 85, alignment: .center)
                                            .background(
                                                LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
                                            )
                                            .cornerRadius(12)
                                        } else {
                                            VStack {
                                                Text("Complete Level \(item.level) to unlock this badges")
                                                    .font(.system(size: 10))
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(.gray)
                                                    .padding(.all, 4)
                                            }
                                            .frame(width: 85, height: 85, alignment: .center)
                                            .background(
                                                LinearGradient(gradient: .init(colors: [Color("accentcolor")]), startPoint: .top, endPoint: .bottom)
                                            )
                                            .cornerRadius(12)
                                        }
                                    })
                                    
                                }
                            }
                        })
                    }
                    .padding()
                    .padding(.horizontal)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 160)
                .padding(.trailing, 2)
                .cornerRadius(8)
                
                // Challenge Accomplishmen
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    Color(.white)
                    
                    VStack(alignment: .leading) {
                        Text("Challenge Accomplishment")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.bottom, 12)
                        
                        ChallengeBadgesRow(showBadgesDetail: $showLevelBadgesDetail, difficulty: "Easy", count: easyTasks.count)
                        
                        ChallengeBadgesRow(showBadgesDetail: $showLevelBadgesDetail, difficulty: "Normal", count: normalTasks.count)
                        
                        ChallengeBadgesRow(showBadgesDetail: $showLevelBadgesDetail, difficulty: "Hard", count: hardTasks.count)
                        
                        ChallengeBadgesRow(showBadgesDetail: $showLevelBadgesDetail, difficulty: "Insane", count: insaneTasks.count)
                    }
                    .padding()
                    .padding(.horizontal)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 480)
                .cornerRadius(8)
                
            }
            .padding()
            
            
            Button(action: {homeData.isPresentedBadgesView.toggle()}, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(Font.system(size: 24, weight: .regular))
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.top, 8)
            })
            
            if showLevelBadgesDetail {
                LevelBadgesDetailView(show: $showLevelBadgesDetail, levelSelected: levelSelected)
                    .frame(width: UIScreen.main.bounds.size.width - 60, height: UIScreen.main.bounds.size.width - 120, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 12, x: 6, y: 6)
                    .alignmentGuide(.trailing, computeValue: { dimension in
                        dimension[HorizontalAlignment.trailing] + 28
                    })
                    .alignmentGuide(.top, computeValue: { dimension in
                        dimension[VerticalAlignment.top] - 280
                    })
            }
        }
    }
}
