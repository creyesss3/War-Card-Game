//
//  ContentView.swift
//  War Card Game
//
//  Created by Christian Reyes on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard: String = "card" + String(Int.random(in: 2...14))
    @State var cpuCard: String = "card" + String(Int.random(in: 2...14))
    
    @State var playerScore: Int = 0
    @State var cpuScore: Int = 0
    
    @State var gameOver: Bool = false
    
    var body: some View {
        
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                if gameOver {
                    Text(winnerMessage())
                        .font(.title)
                        .foregroundColor(.white)
                } else {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Player")
                                .font(.headline)
                                .padding(.bottom, 10.0)
                            Text(String(playerScore))
                                .font(.largeTitle)
                                
                        }
                        Spacer()
                        VStack {
                            Text("CPU")
                                .font(.headline)
                                .padding(.bottom, 10.0)
                            Text(String(cpuScore))
                                .font(.largeTitle)
                        }
                        Spacer()
                    }
                    .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }
    
    func deal() {
        guard !gameOver else {
            // Reset the game
            playerScore = 0
            cpuScore = 0
            gameOver = false
            return
        }
        
        // Randomize the player's card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize the CPU's card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)

        print("Player Card: \(playerCardValue)")
        print("CPU Card: \(cpuCardValue)")

        // Update the score
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if cpuCardValue > playerCardValue {
            cpuScore += 1
        }
        print("Player Score: \(playerScore)")
        print("CPU Score: \(cpuScore)")

        // Check for game over
        if playerScore >= 10 || cpuScore >= 10 {
            gameOver = true
        }
    }
    
    func winnerMessage() -> String {
        if playerScore > cpuScore {
            return "Player wins!"
        } else if cpuScore > playerScore {
            return "CPU wins!"
        } else {
            return "It's a tie!"
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


#Preview {
    ContentView()
}
