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
            VStack{
                Spacer()
                Image("candy")
                 Spacer()
                
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
