//
//  DifficultyButton.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct DifficultyButton: View {
    @ObservedObject var homeData: TaskViewModel
    
    var emoji: String
    var title: String
    
    var body: some View {
        Button(action: {homeData.selectDifficulty(value: title)}, label: {
            VStack {
                Text(emoji)
                    .font(.system(size: 32))
                Text(title)
                    .font(.footnote)
                    .foregroundColor(homeData.difficulty == title ? .white : .gray)
            }
            .frame(width: 70, height: 70, alignment: .center)
            .background(
                homeData.difficulty == title ?
                LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
                : LinearGradient(gradient: .init(colors: [Color("accentcolor")]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(8)
        })
    }
}
