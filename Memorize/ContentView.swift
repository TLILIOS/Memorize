//
//  ContentView.swift
//  Memorize
//
//  Created by HTLILI on 30/06/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🦜", "🐬", "🐣","🐸", "🐓", "🦩", "🐇", "🐈", "🦘", "🐄", "🐑", "🐠","🐙","🦀" ].shuffled()
    @State var cartCount = 4
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cartCount, id: \.self) { index in CardView(content: emojis[index])
                }
                .foregroundColor(.orange)
            }
                HStack {
                    Button("Add Card") {
                        cartCount += 1
                    }
                    Spacer()
                    Button("Remove Card") {
                        cartCount -= 1
                    }
                }
        }
        .padding()
    }
}



struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 30)
            if isFaceUp {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 5)
                Text(content)
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
