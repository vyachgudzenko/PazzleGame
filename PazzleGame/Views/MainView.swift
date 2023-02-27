//
//  MainView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundImage()
                VStack {
                    Image("candy")
                        .padding(.bottom,40)
                    VStack(spacing:16){
                        NavigationLink {
                            LevelsView()
                        } label: {
                            Text("PLAY")
                                .font(Font.custom("knewave", size: 34))
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(height: 70)
                        }

                       NavigationLink {
                            GamesRulesView()
                        } label: {
                            Text("GAME RULES")
                                .font(Font.custom("knewave", size: 34))
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(height: 70)
                                
                        }

                       NavigationLink {
                            EmptyView()
                        } label: {
                            Text("SETTINGS")
                                .font(Font.custom("knewave", size: 34))
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(height: 70)
                                
                        }

                       NavigationLink {
                            EmptyView()
                        } label: {
                            Text("PRIVACY POLICY")
                                .font(Font.custom("knewave", size: 34))
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(height: 70)
                                
                        }

                        
                        
                            
                    }
                    .padding(.horizontal,20)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
