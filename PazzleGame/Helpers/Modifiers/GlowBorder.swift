//
//  GlowBorder.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct GlowBorder:ViewModifier{
    let lineWidth:Int
    
    func body(content: Content) -> some View {
        ZStack(alignment:.center){
            applyShadow(content: AnyView(content), lineWidth: lineWidth)
            content
        }
            
    }
    
    func applyShadow(content:AnyView,lineWidth:Int) -> AnyView{
        if lineWidth == 0{
            return content
        } else {
            return applyShadow(content: AnyView(LinearGradient.pinkGradient.mask({
                content.shadow(color: .customLightPink,radius: 1)
            })), lineWidth: lineWidth - 1 )
        }
    }
}
