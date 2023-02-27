//
//  SettingsView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("soundIsOn") private var soundIsOn:Bool = true
    @AppStorage("vibroIsOn") private var vibroIsOn:Bool = true
    var body: some View {
        ZStack{
            BackgroundImage()
            VStack{
                CustomNavBar(backButtonSize: 60) {
                    dismiss()
                } navBarItem: {
                    HStack{
                        Text("SETTINGS")
                            .modifier(GlowBorder(lineWidth: 10))
                            .modifier(KnewaveFont(size: 34))
                            .foregroundColor(.white)
                            .frame(width: 210)
                    }
                }
                .padding(.bottom,60)
                VStack(spacing:16){
                    HStack{
                        Button {
                            withAnimation {
                                soundIsOn.toggle()
                            }
                        } label: {
                            Text("SOUND")
                                .modifier(KnewaveFont(size: 34))
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(height: 70)
                        }
                        Spacer()
                        Button {
                            withAnimation {
                                soundIsOn.toggle()
                            }
                        } label: {
                            Image(soundIsOn ? "checkmark" : "xmark")
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(width: 60,height: 60)
                        }
                    }
                    HStack{
                        Button {
                            withAnimation {
                                vibroIsOn.toggle()
                            }
                        } label: {
                            Text("VIBRO")
                                .modifier(KnewaveFont(size: 34))
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(height: 70)
                        }
                        Spacer()
                        Button {
                            withAnimation {
                                vibroIsOn.toggle()
                            }
                        } label: {
                            Image(vibroIsOn ? "checkmark" : "xmark")
                                .foregroundColor(.white)
                                .modifier(PinkButton())
                                .frame(width: 60,height: 60)
                        }
                    }
                    Button {
                        print("rate")
                    } label: {
                        Text("RATE US")
                            .modifier(KnewaveFont(size: 34))
                            .foregroundColor(.white)
                            .modifier(PinkButton())
                            .frame(height: 70)
                    }

                }
                Spacer()
            }
            .padding(.horizontal,20)
        }
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
