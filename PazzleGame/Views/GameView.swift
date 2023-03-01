//
//  GameView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 28.02.2023.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var levelVM:LevelViewModel
    @StateObject var gameVM:GameViewModel = GameViewModel()
    @State var gameStatus:GameStatus = .lose
    @State var showPopUp:Bool = false
    let size = UIScreen.main.bounds.size
    var body: some View {
        ZStack(alignment:.center){
            BackgroundImage()
            VStack{
                CustomNavBar(backButtonSize: 35) {
                    dismiss()
                } navBarItem: {
                    HStack{
                        Button {
                            gameStatus = .lose
                            showPopUp = true
                        } label: {
                            Image("reload")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 20)
                                .modifier(StrokedCircle(lineWidth: 5))
                                .frame(width: 35,height: 35)
                        }
                        Spacer()
                        Text("LVL-\(levelVM.currentLevel!.number)")
                            .modifier(KnewaveFont(size: 24))
                            .foregroundColor(.white)
                            .modifier(GlowBorder(lineWidth: 8))
                        
                            .modifier(StrokedWhiteLabel())
                            .frame(width: 100,height: 35)
                        Spacer()
                        Text(gameVM.countdown.timeLeft)
                            .modifier(KnewaveFont(size: 24))
                            .foregroundColor(.white)
                            .modifier(GlowBorder(lineWidth: 8))
                        //.padding(.horizontal)
                            .modifier(StrokedWhiteLabel())
                            .frame(width: 100,height: 35)
                        
                    }
                }
                .padding(.bottom,40)
                ZStack{
                    RoundedRectangle(cornerRadius: 70)
                        .foregroundColor(.white)
                        .frame(width: 330,height: 330)
                    CandyFrame()
                        .frame(width: 340,height: 340)
                }
                .padding(.bottom,32)
                ZStack{
                    Image(levelVM.currentLevel!.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 226,height: 226)
                    CandyFrame()
                        .frame(width: 246,height: 246)
                }
                Spacer()
            }
            .padding(.horizontal,20)
            if gameVM.level != nil {
                popUp(size: size)
                    .opacity(showPopUp ? 1 : 0)
                    .animation(.linear, value: showPopUp)
            }
        }
        .onAppear(perform: {
            gameVM.loadLevel(level: levelVM.currentLevel!)
            gameVM.createTimer()
        })
        .navigationBarHidden(true)
        
    }
    
    @ViewBuilder
    private func popUp(size:CGSize) -> some View{
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
                            .frame(width: size.width,height: 347)
                            .offset(x:gameStatus == .win ? -30 : 0)
                        
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
                        .frame(width: size.width - 40,height: 60)
                    Text("BEST TIME:  " + gameVM.level!.bestTime.timeLeft )
                        .modifier(KnewaveFont(size: 34))
                        .foregroundColor(.white)
                        .modifier(GlowBorder(lineWidth: 8))
                        .modifier(StrokedWhiteLabel())
                        .frame(width: size.width - 40,height: 60)
                }
                .padding(.bottom,37)
                
                HStack(spacing:32){
                    Button {
                        dismiss()
                    } label: {
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .modifier(StrokedCircle(lineWidth: 5))
                            .frame(width: 60,height: 60)
                    }
                    
                    Button {
                        print("")
                    } label: {
                        Image("reload")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: gameStatus == .win ? 30 : 45)
                            .modifier(StrokedCircle(lineWidth: 5))
                            .frame(width: gameStatus == .win ? 60 : 90,height: gameStatus == .win ? 60 : 90)
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(gameStatus == .win ? "backButton" : "backButtonDisabled")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .rotationEffect(.degrees(gameStatus == .win ? 180 : 0))
                            .modifier(StrokedCircle(lineWidth: 5,isDisabled: gameStatus == .lose))
                            .frame(width: 60,height: 60)
                            
                    }
                    .disabled(gameStatus == .lose)
                    
                }
                
                Spacer()
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(LevelViewModel())
    }
}