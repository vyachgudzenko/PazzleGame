//
//  StrokedWhiteLabel.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 28.02.2023.
//

import SwiftUI

struct StrokedWhiteLabel: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment:.center){
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
            RoundedRectangle(cornerRadius: 25)
                .stroke(LinearGradient.pinkGradient, style: StrokeStyle(
                    lineWidth: 5
                ))
            content
        }
    }
}


