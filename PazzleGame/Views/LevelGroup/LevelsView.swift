//
//  LevelsView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct LevelsView: View {
    @EnvironmentObject var levelVM:LevelViewModel
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
                .padding(.bottom,23)
                let grids:[GridItem] = [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                LazyVGrid(columns: grids) {
                    ForEach(levelVM.levels, id: \.id) {
                        level in
                        LevelRow(level: level)
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
            .environmentObject(LevelViewModel())
    }
}
