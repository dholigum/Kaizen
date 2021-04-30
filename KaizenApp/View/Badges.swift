//
//  Badges.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct Badges: View {
    @ObservedObject var homeData = HomeViewModel()
//    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Your Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.top, 8)
            }
            .padding()
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Text("Dismiss Modal")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//            })
        }
    }
}
