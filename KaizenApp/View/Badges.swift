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
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.top, 8)
                
            }
            .padding()
        }
    }
}
