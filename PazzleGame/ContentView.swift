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
                Text("Hello, world!")
                    .font(Font.custom("knewave", size: 30))
                    
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
