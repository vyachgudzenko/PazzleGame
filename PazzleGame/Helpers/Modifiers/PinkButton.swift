//
//  PinkButton.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct PinkButton: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment:.center){
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient.pinkGradient)
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, style: StrokeStyle(
                    lineWidth: 5
                ))
            content
        }
        
        
            
            
        
    }
}


