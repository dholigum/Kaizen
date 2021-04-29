//
//  ModalView.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct ModalView: View {
    @ObservedObject var homeData = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color("accentcolor")
            Text("Add New Task")
                .foregroundColor(.black)
        }
    }
}
