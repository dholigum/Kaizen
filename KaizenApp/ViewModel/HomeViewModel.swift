//
//  HomeViewModel.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var color = ""
    @Published var difficulty = ""
    
    // For NewData sheet
    @Published var isNewData = false
}
