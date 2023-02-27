//
//  CandyFrame.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct CandyFrame: View {
    var body: some View {
        HStack(spacing:0){
            Image("leftFrame")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image("rightFrame")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CandyFrame_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Image("previewLevel0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 226,height: 226)
            CandyFrame()
                .frame(width: 242,height: 242)
        }
    }
}
