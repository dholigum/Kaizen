//
//  Home.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    // Fetching Data ...
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results : FetchedResults<Task>
    
    // For Deleting Data ...
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                    RoundedRectangle(cornerRadius: 16)
                        .gradientForeground(colors: [Color("maincolor"), Color("maincolor2")])
                        .frame(height: 200)
                    HStack {
                        ZStack {
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(Color("accentcolor"), lineWidth: 10)
                                .frame(width: 80, height: 80)
                                .padding(.leading, 28)
                                .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + CGFloat(8))
                            
                            Circle()
                                .trim(from: 0, to: 0.75)
                                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Color.black)
                                .frame(width: 80, height: 80)
                                .padding(.leading, 28)
                                .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + CGFloat(8))
                        }
                        
                        VStack(alignment: .leading, spacing: nil, content: {
                            HStack {
                                Text("Level 2")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                                Button(action: {homeData.isPresentedBadgesView.toggle()}, label: {
                                    Image(systemName: "star.circle")
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 30, weight: .regular))
                                        .padding(.trailing, 8)
                                        .padding(.top, 6)
                                })
                            }
                            Text("350 / 500 XP")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .padding(.vertical, 1)
                            HStack {
                                Text("💡 ")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                    .padding(.trailing, -8)
                                Text("Finish more tasks to gain more 600 experience points")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                            }
                        })
                        .padding()
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
                
                // Empty View ...
                
                if results.isEmpty {
                    Spacer()
                    Text("📭")
                        .font(.system(size: 80))
                        .foregroundColor(.black)
                    Text("No tasks yet …")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text("Create a new task and it will show up here")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                    Spacer()
                    
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(results) { task in
                                HStack {
                                    RoundedRectangle(cornerRadius: 2.5)
                                        .foregroundColor(Color("\(homeData.getStickyColor(difficulty: task.difficulty ?? "maincolor"))"))
                                        .frame(width: 5, height: 42, alignment: .leading)
                                        .padding(.leading, 8)
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text("\(task.title ?? "")")
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Text("\(homeData.getExperiencePoint(difficulty: task.difficulty ?? "0")) XP")
                                                .font(.subheadline)
                                                .fontWeight(.light)
                                                .padding(.trailing, 12)
                                                .foregroundColor(.black)
                                        }
                                        
                                        Text("\(task.date?.getFormattedDateString(format: "EEEE, MMM d, yyyy") ?? Date().getFormattedDateString(format: "EEEE, MMM d, yyyy"))")
                                            .font(.footnote)
                                            .fontWeight(.light)
                                            .foregroundColor(.black)
                                    }
                                }
                                .frame(width: 360, height: 60, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(8)
                                .contextMenu(ContextMenu(menuItems: {
                                    Button(action: {homeData.editItem(item: task)}, label: {
                                        Label(
                                            title: { Text("Edit") },
                                            icon: { Image(systemName: "square.and.pencil") }
                                        )
                                    })
                                    
                                    Button(action: {
                                        context.delete(task)
                                        try! context.save()
                                    }, label: {
                                        Label(
                                            title: { Text("Delete") },
                                            icon: { Image(systemName: "multiply") }
                                        )
                                    })
                                    
                                    Button(action: {
                                        context.delete(task)
                                        try! context.save()
                                    }, label: {
                                        Label(
                                            title: { Text("Mark as Done") },
                                            icon: { Image(systemName: "checkmark") }
                                        )
                                    })
                                }))
                            }
                        }
                        .padding()
                    })
                    .background(Color("accentcolor"))
                }
            }
            
            // Add button
            Button(action: {homeData.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(Font.system(size: 40, weight: .regular))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
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
        .sheet(isPresented: $homeData.isPresentedBadgesView, content: {
            Badges(homeData: homeData)
        })
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(gradient: .init(colors: colors),
                           startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}

extension Date {
    func getFormattedDateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
    }
}
