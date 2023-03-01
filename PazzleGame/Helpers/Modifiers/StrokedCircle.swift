//
//  StrokedCircle.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct StrokedCircle: ViewModifier {
    let lineWidth:CGFloat
    var isDisabled:Bool? = nil
    func body(content: Content) -> some View {
        ZStack(alignment:.center){
            Circle()
                .fill(.white)
            if isDisabled != nil && isDisabled == true{
                Circle()
                    .stroke(Color.gray, style: StrokeStyle(
                        lineWidth: lineWidth
                    ))
            } else {
                Circle()
                    .stroke(LinearGradient.pinkGradient, style: StrokeStyle(
                        lineWidth: lineWidth
                    ))
            }
            content
        }
    }
}
