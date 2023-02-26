//
//  MainView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            BackgroundImage()
            Text("Main")
                .font(Font.custom("knewave", size: 50))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
