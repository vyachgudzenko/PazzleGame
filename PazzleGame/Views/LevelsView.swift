//
//  LevelsView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct LevelsView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            BackgroundImage()
            VStack{
                
                CustomNavBar(backButtonSize: 60) {
                    dismiss()
                } navBarItem: {
                    HStack{
                        Text("LEVELS")
                            .modifier(GlowBorder(lineWidth: 8))
                            .modifier(KnewaveFont(size: 34))
                            .foregroundColor(.white)
                            .frame(width: 210)
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal,20)
        }
        .navigationBarHidden(true)
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
