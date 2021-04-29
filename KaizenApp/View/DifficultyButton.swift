//
//  DifficultyButton.swift
//  KaizenApp
//
//  Created by Syahrul Apple Developer BINUS on 29/04/21.
//

import SwiftUI

struct DifficultyButton: View {
    var body: some View {
        Button(action: {}, label: {
            VStack {
                Text("🤓")
                    .font(.system(size: 32))
                Text("Easy")
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            .frame(width: 70, height: 70, alignment: .center)
            .background(
                LinearGradient(gradient: .init(colors: [Color("maincolor"), Color("maincolor2")]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(8)
        })
    }
}
