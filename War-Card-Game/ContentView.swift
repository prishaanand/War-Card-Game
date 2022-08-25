//
//  ContentView.swift
//  War-Card-Game
//
//  Created by Prisha Anand on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    
    //properties
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        
        ZStack{
            Image("background")
                .edgesIgnoringSafeArea([.all])
            
            VStack{
                //logo
                Spacer()
                Image("logo")
                    .padding([.all])
                Spacer()
                
                //cards
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }

                //deal button
                Spacer()
                Button (action: {
                    
                    // Generate a random number between 2-14
                    let randPlayer = Int.random(in: 2...14)
                    let randCpu = Int.random(in: 2...14)
                    
                    //update cards
                    playerCard = "card" + String(randPlayer)
                    cpuCard = "card" + String(randCpu)
                    
                    //update score
                    if(randPlayer > randCpu){
                        playerScore += 1
                    }
                    else if (randPlayer < randCpu){
                        cpuScore += 1
                    }
                    //else, do nothing since equal
                    
                    
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                
                //score
                HStack{
                    Spacer()
                    //player score
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }.foregroundColor(Color.white)

                    Spacer()
                    //cpu score
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }.foregroundColor(Color.white)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
