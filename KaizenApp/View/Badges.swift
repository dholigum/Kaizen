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
                        Text("Level Accomplishment \(currentLevel)")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            LazyHStack(spacing: 16) {
                                ForEach(levels) { item in
                                    VStack {
                                        Text("\(item.level)")
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .background(
                                        item.level <= 3 ? LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
                                        : LinearGradient(gradient: .init(colors: [Color("accentcolor")]), startPoint: .top, endPoint: .bottom)
                                    )
                                    .cornerRadius(12)
                                }
                            }
                        })
                        .padding(.trailing, 16)
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
        }
    }
}
