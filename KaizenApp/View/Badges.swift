//
//  Badges.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct Badges: View {
    @ObservedObject var homeData = TaskViewModel()
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.top, 8)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack(spacing: 10) {
                        Text("HHEHE")
                        Text("HHEHE")
                    }
                })
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
