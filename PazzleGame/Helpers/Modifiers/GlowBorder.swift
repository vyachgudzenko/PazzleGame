//
//  GlowBorder.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct GlowBorder:ViewModifier{
    let color:Color
    let lineWidth:Int
    
    func body(content: Content) -> some View {
        applyShadow(content: AnyView(content), lineWidth: lineWidth)
    }
    
    func applyShadow(content:AnyView,lineWidth:Int) -> AnyView{
        if lineWidth == 0{
            return content
        } else {
            return applyShadow(content: AnyView(content.shadow(color: color, radius: 1)), lineWidth: lineWidth - 1 )
        }
    }
}
