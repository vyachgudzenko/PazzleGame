//
//  ContentView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundImage()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                
                    
                        Text("Hello")
                            .font(Font.custom("knewave", size: 74))
                            .foregroundColor(.white)
                            .modifier(GlowBorder( lineWidth: 15))
                HStack(spacing:0){
                    ZStack{
                        Text("H")
                            .font(Font.custom("knewave", size: 89))
                            .foregroundColor(.customPink)
                        Text("H")
                            .font(Font.custom("knewave", size: 74))
                            .foregroundColor(.white)
                    }
                    ZStack{
                        Text("e")
                            .font(Font.custom("knewave", size: 89))
                            .foregroundColor(.customPink)
                        Text("e")
                            .font(Font.custom("knewave", size: 74))
                            .foregroundColor(.white)
                    }
                }
                    
                    
                        
                
                    
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
