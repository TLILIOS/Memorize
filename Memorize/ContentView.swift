//
//  ContentView.swift
//  Memorize
//
//  Created by HTLILI on 30/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}



struct CardView: View {
    var isFaceUp = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(lineWidth: 5)
                Text("🐥")
                    .font(.largeTitle)
                
            } else {
                RoundedRectangle(cornerRadius: 30)
                   
            }
        }
    }
}


#Preview {
    ContentView()
}
