//
//  PlayingField.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 02.03.2023.
//

import SwiftUI

struct PlayingField: View {
    @EnvironmentObject var gameVM:GameViewModel
    @State var width:CGFloat = 0
    @State private var startLocation:CGPoint = CGPoint(x: 0, y: 0)
    @State private var endLocation:CGPoint = CGPoint(x: 0, y: 0)
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack(alignment:.center){
                
                ForEach(gameVM.partsOfImage, id: \.hashValue) {
                    part in
                    Image(uiImage: UIImage(cgImage: part))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width,height: width)
                        .position(getPosition(item: part))
                        .animation(.linear)
                }
                
            }
            .coordinateSpace(name: "board")
            .gesture(
                DragGesture(coordinateSpace: .named("board"))
                
                    .onEnded({ gesture in
                        startLocation = gesture.startLocation
                        endLocation = gesture.location
                    })
            )
            .onChange(of: startLocation, perform: { newValue in
                gameVM.startIndex = findPartByPosition(location: newValue)
            })
            .onChange(of: endLocation, perform: { newValue in
                gameVM.endIndex = findPartByPosition(location: newValue)
                gameVM.replaced()
            })
            .frame(width: geo.size.width,height: geo.size.width)
            .onAppear {
                width  = geo.size.width / 4
            }
            //.offset(y:100)
        }
    }
    
    private func findPartByPosition(location:CGPoint) -> Int{
        let col = Int(location.x / width)
        let row = Int(location.y / width)
        var index:Int = 0
        index = row * 4 + col
        return index
    }
    
    private func getPosition(item:CGImage) -> CGPoint{
        var position:CGPoint = .zero
        let index = gameVM.partsOfImage.firstIndex(of: item)!
        switch index{
        case 0...3:
            position.x = width * CGFloat(index) + 50.0
            position.y = width * 0.0 + 50.0
        case 4...7:
            position.x = width * CGFloat(index - 4) + 50.0
            position.y = width * 1.0 + 50.0
        case 8...11:
            position.x = width * CGFloat(index - 8) + 50.0
            position.y = width * 2.0 + 50.0
        case 12...15:
            position.x = width * CGFloat(index - 12) + 50.0
            position.y = width * 3.0 + 50.0
        default:
            position.x = 0
            position.y = 0
        }
        return position
    }

}

struct PlayingField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            PlayingField()
            
        }
    }
}
