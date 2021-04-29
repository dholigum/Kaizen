//
//  ModalView.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct ModalView: View {
    @ObservedObject var homeData = HomeViewModel()
    @State var backgroundColor = Color("accentcolor")
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Add New Task")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.top, 8)
                
                Text("Task Title")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.leading, 20)

                TextEditor(text: $homeData.title)
                    .foregroundColor(.black)
                    .frame(width: 325, height: 40)
                    .cornerRadius(8)
                    .padding(.leading)
                    .padding(.top, -4)
                
                // Date picker
                HStack {
                    Text("Due Date")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading, 8)
                    
                    Spacer()

                    DatePicker("", selection: $homeData.date)
                        .labelsHidden()
                        .padding(.trailing, 8)
                }
                .frame(width: 325, height: 48, alignment: .leading)
                .background(Color.white)
                .cornerRadius(8)
                .padding()
                
                // Difficulty picker
                VStack(alignment: .leading) {
                    Text("Difficulty")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading, 8)
                        .padding(.bottom, 4)

                    HStack(spacing: 10) {
                        DifficultyButton()
                        DifficultyButton()
                        DifficultyButton()
                        DifficultyButton()
                    }
                    .padding(.leading, 8)
                }
                .frame(width: 325, height: 130, alignment: .leading)
                .background(Color.white)
                .cornerRadius(8)
                .padding()
                .padding(.top, -16)
                
                Spacer()
                
                // Add or Update task button
                Button(action: {}, label: {
                    Text("Add New")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                })
                .frame(width: 325, height: 48, alignment: .center)
                .background(
                    LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
                .padding(.horizontal)
            }
            .padding()
            
        }
    }
}
