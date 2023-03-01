//
//  LevelRow.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct LevelRow: View {
    let level:Level
    
    var body: some View {
        ZStack{
            Image(level.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 102,height: 102)
            if level.isLocked{
                ZStack{
                    Color.black.opacity(0.5)
                    Image("lolipop")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 102,height: 102)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            CandyFrame()
                .frame(width: 112,height: 112)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("\(level.number)")
                        .foregroundColor(.white)
                        .modifier(KnewaveFont(size: 15))
                        .modifier(GlowBorder(lineWidth: 4))
                        .modifier(StrokedCircle(lineWidth: 2))
                        .frame(width: 24,height: 24)
                        .offset(x:-5,y: -2)
                }
            }
        }
        
    }
}

struct LevelRow_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
            .environmentObject(LevelViewModel())
    }
}
