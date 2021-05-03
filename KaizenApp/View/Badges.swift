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
    @State var showBadgesDetail = false
    @State var levelSelected: Int = 1
    
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
                                                showBadgesDetail.toggle()
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
                                            .frame(width: 80, height: 80, alignment: .center)
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
                                            .frame(width: 80, height: 80, alignment: .center)
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
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 160)
                .padding(.trailing, 2)
                .cornerRadius(8)
                
                // Challenge Accomplishmen
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    Color(.white)
                    
                    VStack(alignment: .leading) {
                        Text("Challenge Accomplishment \(currentLevel)")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            LazyHStack(spacing: 16) {
                                ForEach(levels) { item in
                                    
                                    Button(action: {
                                        withAnimation {
                                            showBadgesDetail.toggle()
                                        }
                                    }, label: {
                                        VStack {
                                            Text("\(item.level)")
                                        }
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .background(
                                            item.level <= 3 ? LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
                                                : LinearGradient(gradient: .init(colors: [Color("accentcolor")]), startPoint: .top, endPoint: .bottom)
                                        )
                                        .cornerRadius(12)
                                    })
                                    
                                }
                            }
                        })
                    }
                    .padding()
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 160)
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
            
            if showBadgesDetail {
                BadgesDetailView(show: $showBadgesDetail, levelSelected: levelSelected)
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
