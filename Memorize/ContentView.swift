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
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}



struct CardView: View {
 @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 30)
            if isFaceUp {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 5)
                Text("🐥")
                    .font(.largeTitle)
                
            } else {
                base
                   
            }
        }
        .onTapGesture {
            print("Flip Over")
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
