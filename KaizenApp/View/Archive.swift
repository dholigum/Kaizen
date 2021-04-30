//
//  Archieve.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 30/04/21.
//

import SwiftUI

struct Archive: View {
    @ObservedObject var homeData = TaskViewModel()
    
    @FetchRequest(entity: Progress.entity(), sortDescriptors: [NSSortDescriptor(key: "level", ascending: true)], animation: .spring()) var results : FetchedResults<Progress>
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color("accentcolor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Completed Tasks")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.top, 8)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(results) { progress in
                            HStack {
                                RoundedRectangle(cornerRadius: 2.5)
                                    .foregroundColor(Color("maincolor"))
                                    .frame(width: 5, height: 42, alignment: .leading)
                                    .padding(.leading, 8)
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("xpNow: \(progress.xpNow)")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("Level: \(progress.level)")
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                            .padding(.trailing, 12)
                                            .foregroundColor(.black)
                                    }
                                    
                                    Text("xpToComplete: \(progress.xpToComplete)")
                                        .font(.footnote)
                                        .fontWeight(.light)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 320, height: 60, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(8)
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action: {}, label: {
                                    Label(
                                        title: { Text("Edit") },
                                        icon: { Image(systemName: "square.and.pencil") }
                                    )
                                })
                                
                                Button(action: {}, label: {
                                    Label(
                                        title: { Text("Delete") },
                                        icon: { Image(systemName: "multiply") }
                                    )
                                })
                                
                                Button(action: {}, label: {
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
            .padding()
        }
    }
}
