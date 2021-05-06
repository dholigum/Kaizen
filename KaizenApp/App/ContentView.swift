//
//  ContentView.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    init() {
        // background color for TextEdit
        UITextView.appearance().backgroundColor = .white
    }

    var body: some View {
        Home()
    }
}
