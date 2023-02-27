//
//  LaunchScreen.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var showNextScreen:Bool = false
    var body: some View {
        ZStack{
            BackgroundImage()
            VStack(spacing:3){
                Spacer()
                    .frame(height: 155)
                Image("candy")
                
                VStack(spacing:0){
                    Text("Juicy")
                        .modifier(GlowBorder(lineWidth: 15))
                     Text("Sweet")
                        .modifier(GlowBorder( lineWidth: 15))
                        .offset(y:-20)
                     Text("Story")
                        .modifier(GlowBorder( lineWidth: 15))
                        .offset(y:-40)
                }
                .foregroundColor(.white)
                .modifier(KnewaveFont(size: 74))
                 Spacer()
                
                    Text("Loading...")
                        .foregroundColor(.white)
                        .modifier(KnewaveFont(size: 34))
                        .modifier(GlowBorder( lineWidth: 15))
                    
                Spacer()
                    .frame(height: 60)
                
            }
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
                withAnimation(.linear(duration: 0.2)) {
                    self.showNextScreen = true
                }
            }))
            
        }
        .fullScreenCover(isPresented: $showNextScreen) {
            MainView()
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
