//
//  KnewaveFont.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct KnewaveFont:ViewModifier{
    let size:CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("knewave", size: size))
    }
}
