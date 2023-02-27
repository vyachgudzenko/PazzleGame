//
//  StrokedCircle.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct StrokedCircle: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment:.center){
            Circle()
                .fill(.white)
            Circle()
                .stroke(LinearGradient.pinkGradient, style: StrokeStyle(
                    lineWidth: 2
                ))
            content
        }
    }
}
