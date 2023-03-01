//
//  GamePopUp.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 01.03.2023.
//

import SwiftUI

enum GameStatus:String{
    case win = "levelCompleted"
    case lose = "levelFailed"
}

struct GamePopUp: View {
    @EnvironmentObject var gameVM:GameViewModel
    let gameStatus:GameStatus
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Color.black.ignoresSafeArea()
                    .opacity(0.7)
                VStack(spacing:0){
                    Spacer()
                    ZStack{
                        
                        VStack{
                            Image(gameStatus.rawValue)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width,height: 347)
                                .offset(x:-30)
                            
                            Spacer()
                        }
                        VStack{
                            Spacer()
                            Text("LEVEL COMPLETED")
                                .modifier(KnewaveFont(size: 64))
                                .modifier(GlowBorder(lineWidth: 15))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(height: 200)
                                
                        }
                        
                    }
                    .frame(height: 442)
                    .padding(.bottom,24)
                    VStack(spacing:27){
                        Text("TIME:  " + gameVM.value.timeLeft )
                            .modifier(KnewaveFont(size: 34))
                            .foregroundColor(.white)
                            .modifier(GlowBorder(lineWidth: 8))
                            .modifier(StrokedWhiteLabel())
                            .frame(width: geo.size.width - 40,height: 60)
                        Text("BEST TIME:  " + gameVM.level!.bestTime.timeLeft )
                            .modifier(KnewaveFont(size: 34))
                            .foregroundColor(.white)
                            .modifier(GlowBorder(lineWidth: 8))
                            .modifier(StrokedWhiteLabel())
                            .frame(width: geo.size.width - 40,height: 60)
                    }
                    .padding(.bottom,37)
                    
                    
                    Spacer()
                }
                
            }
        }
        
    }
}

