//
//  ContentView.swift
//  WarChallenge
//
//  Created by Juan Hernandez Pazos on 07/07/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    private let generator = UISelectionFeedbackGenerator()
    
    // MARK: View
    var body: some View {
        ZStack {
            Image("background")
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
                    // Generate a random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // Update the score
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    
                    // Make taptic response
                    generator.selectionChanged()
                    
                } label: {
                    Image("dealbutton")
                }

                Spacer()
                
                HStack {
                    Spacer()
                    HStack {
                        VStack(spacing: 20) {
                            Text("Player")
                                .font(.headline)
                            Text(String(playerScore))
                                .font(.largeTitle)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        VStack(spacing: 20) {
                            Text("Device")
                                .font(.headline)
                            Text("\(cpuScore)")
                                .font(.largeTitle)
                        }
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                Spacer()
            } // VStack
        } // ZStack
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
