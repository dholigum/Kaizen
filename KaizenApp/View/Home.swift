//
//  Home.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color("maincolor"))
                        .frame(height: 200)
                    Text("Your Level")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                })
                
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .background(Color.white)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        
                    }
                    .padding()
                })
            }
            // Add button
            Button(action: {}, label: {
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
    }
}
