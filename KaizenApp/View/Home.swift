//
//  Home.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                    RoundedRectangle(cornerRadius: 16)
                        .gradientForeground(colors: [Color("maincolor"), Color("maincolor2")])
                        .frame(height: 200)
                    HStack {
                        Text("🏆")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.leading, 16)
                            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        VStack(alignment: .leading, spacing: nil, content: {
                            Text("Level 2")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("350 / 500 XP")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                            HStack {
                                Text("💡 ")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                Text("Finish more tasks to gain more 600 experience points")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                            }
                        })
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
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        HStack {
                            RoundedRectangle(cornerRadius: 2.5)
                                .foregroundColor(Color("greencolor"))
                                .frame(width: 5, height: 42, alignment: .leading)
                                .padding(.leading, 8)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Learn Swift Programming")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Text("100 XP")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        .padding(.trailing, 12)
                                        .foregroundColor(.black)
                                }
                                
                                Text("7PM - Mei 2, 2021")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(width: 360, height: 60, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                    .padding()
                })
                .background(Color("accentcolor"))
            }
            // Add button
            Button(action: {homeData.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [Color("maincolor2"), Color("maincolor2")]), center: .center)
                    )
                    .clipShape(Circle())
            })
            .padding()
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.isNewData, content: {
            ModalView(homeData: homeData)
        })
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}
