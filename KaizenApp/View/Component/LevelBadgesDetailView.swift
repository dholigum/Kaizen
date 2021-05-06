//
//  BadgesDetailView.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 03/05/21.
//

import SwiftUI

struct LevelBadgesDetailView: View {
    
    @Binding var show: Bool
    var levelSelected: Int
    
    var levelTask = LevelTask()
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack {
                ZStack {
                    Image("congrats-ribbon")
                        .resizable()
                        .frame(width: 70, height: 60, alignment: .center)
                        .padding(.top, -16)
                    Text("\(levelSelected)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("yellowcolor"))
                        .padding(.bottom, 28)
                }
                Text("Level \(levelSelected) Complete!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, -16)
                Text("\(levelTask.getCurrentLevelXPToComplete(levelSelected)) XP")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.white)

                Text("\"\(levelTask.getCurrentLevelQuotesCompletion(levelSelected - 1).quote)\"")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .italic()
                    .foregroundColor(.white)
                    .frame(width: 320, height: 60, alignment: .center)
                    .multilineTextAlignment(.center)
                Text("- \(levelTask.getCurrentLevelQuotesCompletion(levelSelected - 1).author)")
                    .font(.footnote)
                    .fontWeight(.light)
                    .italic()
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 10)
            .background(
                LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(16)
            
            Button(action: {
                withAnimation {
                    show.toggle()
                }
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}
