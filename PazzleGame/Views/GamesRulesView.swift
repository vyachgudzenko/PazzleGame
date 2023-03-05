//
//  GamesRulesView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct GamesRulesView: View {
    @Environment(\.dismiss) private var dismiss
    let rules:String = """
    Explore every of 12 levels, move puzzles to create the same picture as in example.
    Each level have time limitation on pass it, and it's time will decrease in each level.
    If you loose - you can try to pass level again.
    If you win - you can pass the next level.
    """
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment:.top){
                BackgroundImage()
                //LinearGradient.pinkGradient
                //    .ignoresSafeArea()
                //    .opacity(0.9)
                VStack(spacing:0){
                    CustomNavBar(backButtonSize: 60) {
                        dismiss()
                    } navBarItem: {
                        HStack{
                            Text("GAME RULES")
                                .modifier(GlowBorder(lineWidth: 10))
                                .modifier(KnewaveFont(size: 34))
                                .foregroundColor(.white)
                                .frame(width: 210)
                        }
                        
                    }
                    .padding(.bottom,43)
                    VStack(spacing:24){
                        Text("Welcome to Juicy Sweet Story!")
                            .modifier(GlowBorder(lineWidth: 15))
                            .modifier(KnewaveFont(size: 34))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(height: 114)
                        Text(rules)
                            .modifier(KnewaveFont(size: 24))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    
                }
                .padding(.horizontal,20)
                
            }
            .frame(height: geo.size.height)
            .navigationBarHidden(true)
        }
    }
}

struct GamesRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesRulesView()
    }
}
