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
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
             cartCount += offset
        }
               , label: {
            Image(systemName: symbol)
        })
        .disabled(cartCount + offset < 1 || cartCount + offset > emojis.count)
    }
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cartCount, id: \.self) { index in CardView(content: emojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
//        Button(action: {
//            if cartCount > 1 {
//                cartCount -= 1
//            }
//        }
//               , label: {
//            Image(systemName:"rectangle.stack.fill.badge.minus")
//        })
    }
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
//        Button(action: {
//            if  cartCount < emojis.count {
//                cartCount += 1
//            }
//        },
//               label: {
//            Image(systemName: "rectangle.stack.fill.badge.plus")
//        })
    }
}



struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0: 1)
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
