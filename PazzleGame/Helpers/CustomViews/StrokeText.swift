//
//  StrokeText.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            
            Text(text)
        }
    }
}

struct StrokeText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            StrokeText(text: "Test", width: 5.0, color: .init(red: 0.68, green: 0.1, blue: 0.55))
                .font(Font.custom("knewave", size: 74))
                .foregroundColor(.white)
        }
    }
}
