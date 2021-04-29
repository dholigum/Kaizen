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
        UITextView.appearance().backgroundColor = UIColor(named: "accentcolor")
    }

    var body: some View {
        Home()
    }
}
