//
//  TaskModal.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct TaskModal: View {
    @ObservedObject var homeData = TaskViewModel()
    @Environment(\.managedObjectContext) var contextTask
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("\(homeData.updateItem == nil ? "Add New" : "Update") Task")
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
                        DifficultyButton(homeData: homeData, emoji: "🤓", title: "Easy")
                        DifficultyButton(homeData: homeData, emoji: "🙂", title: "Medium")
                        DifficultyButton(homeData: homeData, emoji: "😠", title: "Hard")
                        DifficultyButton(homeData: homeData, emoji: "😤", title: "Insane")
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
                Button(action: {homeData.writeData(context: contextTask)}, label: {
                    Text(homeData.updateItem == nil ? "Add Now" : "Update")
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
                .disabled(homeData.title == "" && homeData.difficulty == "" ? true : false)
                .opacity(homeData.title == "" ? 0.5 : 1)
            }
            .padding()
            
            Button(action: {
                homeData.isNewData.toggle()
                
                // Reset to default add new task
                homeData.title = ""
                homeData.difficulty = ""
                homeData.updateItem = nil
            }, label: {
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
