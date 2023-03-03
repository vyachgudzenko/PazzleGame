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
    @State var showPopUp:Bool = false
    let size = UIScreen.main.bounds.size
    var body: some View {
        ZStack(alignment:.center){
            BackgroundImage()
            VStack{
                CustomNavBar(backButtonSize: 35) {
                    gameVM.resetTimer()
                    dismiss()
                } navBarItem: {
                    HStack{
                        Button {
                            gameVM.startOver()
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
                            .modifier(StrokedWhiteLabel())
                            .frame(width: 100,height: 35)
                        
                    }
                }
                .padding(.bottom,40)
                PlayingField()
                    .frame(width: 315,height: 315)
                    .environmentObject(gameVM)
                    .clipShape(RoundedRectangle(cornerRadius: 68))
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
            .onChange(of: gameVM.gameStatus) { newValue in
                if newValue != .inProgress{
                    showPopUp = true
                }
                if newValue == .win{
                    levelVM.unblockNextLevel()
                    levelVM.getLevels()
                }
            }
            if gameVM.level != nil {
                popUp(size: size)
                    .opacity(showPopUp ? 1 : 0)
                    .animation(.linear, value: showPopUp)
            }
        }
        .onAppear(perform: {
            gameVM.loadLevel(level: levelVM.currentLevel!)
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
                        Image(gameVM.gameStatus.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size.width,height: 347)
                            .offset(x:gameVM.gameStatus == .win ? -30 : 0)
                        
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Text("LEVEL " + (gameVM.gameStatus == .win ? "COMPLETED" : "FAILED"))
                            .modifier(KnewaveFont(size: 64))
                            .modifier(GlowBorder(lineWidth: 15))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .frame(width: gameVM.gameStatus == .win ? size.width : size.width - 40,height: 200)
                        
                    }
                    
                }
                .frame(height: 442)
                .padding(.bottom,24)
                VStack(spacing:27){
                    Text("TIME:  " + gameVM.finalTime.timeLeft )
                        .modifier(KnewaveFont(size: 34))
                        .foregroundColor(.white)
                        .modifier(GlowBorder(lineWidth: 8))
                        .modifier(StrokedWhiteLabel())
                        .frame(width: size.width - 40,height: 60)
                    if gameVM.gameStatus == .win {
                        Text("BEST TIME:  " +  (gameVM.level!.bestTime > 0 ? gameVM.level!.bestTime.timeLeft : gameVM.finalTime.timeLeft))
                            .modifier(KnewaveFont(size: 34))
                            .foregroundColor(.white)
                            .modifier(GlowBorder(lineWidth: 8))
                            .modifier(StrokedWhiteLabel())
                            .frame(width: size.width - 40,height: 60)
                    }
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
                        gameVM.startOver()
                        showPopUp = false
                    } label: {
                        Image("reload")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: gameVM.gameStatus == .win ? 30 : 45)
                            .modifier(StrokedCircle(lineWidth: 5))
                            .frame(width: gameVM.gameStatus == .win ? 60 : 90,height: gameVM.gameStatus == .win ? 60 : 90)
                            .offset(y: gameVM.gameStatus == .lose ? 15 : 0)
                    }
                    
                    Button {
                        if levelVM.currentLevel!.number < levelVM.levels.count{
                            levelVM.loadNextLevel()
                            gameVM.loadLevel(level: levelVM.currentLevel!)
                            gameVM.gameStatus = .inProgress
                            showPopUp = false
                        } else {
                            dismiss()
                        }
                    } label: {
                        Image(gameVM.gameStatus == .win ? "backButton" : "backButtonDisabled")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .rotationEffect(.degrees(gameVM.gameStatus == .win ? 180 : 0))
                            .modifier(StrokedCircle(lineWidth: 5,isDisabled: gameVM.gameStatus == .lose))
                            .frame(width: 60,height: 60)
                            
                    }
                    .disabled(gameVM.gameStatus == .lose)
                    
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
