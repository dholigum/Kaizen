//
//  ChallengeBadgesRow.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 03/05/21.
//

import SwiftUI

struct ChallengeBadgesRow: View {
    
    @Binding var showBadgesDetail: Bool
    
    var difficulty: String
    var count: Int
    
    var challengeType: [Challenge] {
        switch difficulty {
        case "Easy":
            return easyDifficultChallenges
        case "Normal":
            return normalDifficultChallenges
        case "Hard":
            return hardDifficultChallenges
        case "Insane":
            return insaneDifficultChallenges
        default:
            return normalDifficultChallenges
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(challengeType) { item in
                
                Button(action: {
                    if item.countToUnlock <= count {
                        withAnimation {
                            showBadgesDetail.toggle()
                        }
                    } else {
                        return
                    }
                }, label: {
                    if item.countToUnlock <= count {
                        VStack {
                            Image("\(item.badgesImage)")
                                .resizable()
                                .frame(width: 50, height: 45, alignment: .center)
                            Text("\(item.difficulty) Task \(item.nickname)")
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
                            Text("Complete \(item.countToUnlock) \(item.difficulty) Tasks to unlock this badges")
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
        .padding(.bottom, 10)
    }
}
