//
//  CustomNavBar.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct CustomNavBar<NavBarItem:View>: View {
    let navBarItem:NavBarItem
    let backButtonSize:CGFloat
    let dismissAction:() -> Void
    
    init(backButtonSize:CGFloat,dismissAction: @escaping () -> Void,@ViewBuilder navBarItem: () -> NavBarItem) {
        self.navBarItem = navBarItem()
        self.backButtonSize = backButtonSize
        self.dismissAction = dismissAction
    }
    
    var body: some View {
        HStack(spacing:0){
            Button {
                dismissAction()
            } label: {
                ZStack{
                    Circle()
                        .fill(Color.white)
                    Circle()
                        .stroke(LinearGradient.pinkGradient, style: StrokeStyle(
                            lineWidth: 5
                        ))
                    Image("backButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: backButtonSize * 0.62)
                        .offset(x:-2)
                }
                .frame(width: backButtonSize,height: backButtonSize)
                
            }
            
            navBarItem
                .padding(.leading,20)
            Spacer()

        }
        .frame(height: 72)
        .padding(.top,70)
        
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            CustomNavBar(backButtonSize: 60) {
                print("its working")
            } navBarItem: {
                Text("Test")
                   // .modifier(GlowBorder(lineWidth: 5))
                    .modifier(KnewaveFont(size: 34))
                    .foregroundColor(.white)
            }

        }
    }
}

