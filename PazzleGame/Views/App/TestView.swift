//
//  TestView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 03.03.2023.
//

import SwiftUI


struct TestView: View {
    @State private var items:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    @State private var items2:[Int] = []
    @State var width:CGFloat = 0
    @State private var startLocation:CGPoint = CGPoint(x: 0, y: 0)
    @State private var endLocation:CGPoint = CGPoint(x: 0, y: 0)
    @State private var startIndex:Int? = nil
    @State private var endIndex:Int? = nil
    
    var compareArrays:Bool{
        return items == items2
    }
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                
                VStack{
                    ZStack{
                        ForEach(items2, id: \.hashValue){
                            item in
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.indigo)
                                    
                                Text("\(item)")
                                    .foregroundColor(.white)
                            }
                            .frame(width: width,height: width)
                            .position(getPosition(item: item))
                        }
                    }
                    .frame(width: geo.size.width,height: geo.size.width)
                    .coordinateSpace(name: "board")
                    .gesture(
                        DragGesture(minimumDistance: width / 2, coordinateSpace: .named("board"))
                        
                            .onEnded({ gesture in
                                
                                    startLocation = gesture.startLocation
                                
                               
                                    endLocation = gesture.location
                                
                            })
                    )
                    .onChange(of: startLocation, perform: { newValue in
                        startIndex = findPartByPosition(location: newValue)
                    })
                    .onChange(of: endLocation, perform: { newValue in
                        endIndex = findPartByPosition(location: newValue)
                        replaced()
                    })
                    
                    HStack{
                        Text(startIndex != nil ? "\(startIndex!)" : "nil")
                        Text(endIndex != nil ? "\(endIndex!)" : "nil")
                        
                    }
                    
                    Text(compareArrays ? "Compare" : "Not")
                    
                    Button {
                        replaced()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.orange)
                            Text("replaced")
                                .foregroundColor(.white)
                        }
                        .frame(width: 100,height: 50)
                            
                    }
                    
                    
                }
            }
            .animation(.linear)
            .onAppear {
                 width = geo.size.width / 4
                items2 = items.shuffled()
            }
        }
    }
    
    func replaced(){
        if startIndex != nil && endIndex != nil{
            
            if startIndex! <= items.count - 1 && endIndex! <= items.count - 1{
                items2.swapAt(startIndex!, endIndex!)
            }
        }
    }
    
    private func findPartByPosition(location:CGPoint) -> Int{
        let col = Int(location.x / width)
        let row = Int(location.y / width)
        var index:Int = 0
        index = row * 4 + col
        return index
    }
    
    private func getPosition(item:Int) -> CGPoint{
        var position:CGPoint = .zero
        let index = items2.firstIndex(of: item)!
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

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
