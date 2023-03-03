//
//  ContentView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI

struct Person:Equatable{
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    var number:Int
    var name:String
    var position:(x:Int,y:Int) = (x:0,y:0)
    
}

struct ContentView: View {
    @State var size:CGSize = CGSize(width: 0, height: 0)
    @State var cropSize:CGSize = CGSize(width: 0, height: 0)
    @State var cgImage:CGImage? = nil
    @State var imageArr:[CGImage] = []
    @State var startPerson:Person? = nil
    @State var endPerson:Person? = nil
    @State var arr:[Person] = []
    @State private var startLocation:CGPoint = CGPoint(x: 0, y: 0)
    @State private var endLocation:CGPoint = CGPoint(x: 0, y: 0)
    
    var body: some View {
        ZStack{
            BackgroundImage()
            ZStack{
                VStack{
                    ZStack{
                        ForEach(arr, id: \.number){
                            item in
                            ZStack{
                                Circle()
                                    .foregroundColor(item == startPerson ? .green :.indigo)
                                    .foregroundColor(item == endPerson ? .red : .indigo)
                                Text("\(item.name)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                            }
                            .onTapGesture {
                                startPerson = item
                                
                            }
                            .frame(width: 100)
                            .position(getPosition(number: item.number))
                        }
                    }
                    .coordinateSpace(name: "hstack")
                    .frame(height: 400)
                    .background {
                        Color.red
                    }
                    .gesture(
                        DragGesture(coordinateSpace: .named("board"))
                            .onEnded({ gesture in
                                startLocation = gesture.startLocation
                                endLocation = gesture.location
                            })
                    )
                    .onChange(of: startLocation, perform: { newValue in
                        startPerson = findPartByPosition(location: newValue)
                    })
                    .onChange(of: endLocation, perform: { newValue in
                        endPerson = findPartByPosition(location: newValue)
                        
                    })
                    VStack{
                        Text("start " + (startPerson?.name ?? "nil"))
                            .foregroundColor(.indigo)
                            .font(.system(size: 30))
                        Text("end " + (endPerson?.name ?? "nil"))
                            .foregroundColor(.indigo)
                            .font(.system(size: 30))
                    }
                    .offset(y:200)
                    Button(action: {
                        replaced()
                    }, label: {
                        Text("Replace")
                            .foregroundColor(.indigo)
                            .font(.system(size: 50))
                    })
                    .offset(y:200)
                    Spacer()
                }
            }
            
            
        }
        .animation(.linear(duration: 0.5))
        .onAppear {
            createPartsOfImage()
        }
        
        
        
        
    }
    
    
    
    func getPosition(number:Int) -> CGPoint{
        var position:CGPoint = .zero
        switch number{
        case 0...3:
            position.x = CGFloat(100 * number + 50)
            position.y = CGFloat(100 * 0 + 50)
        case 4...7:
            position.x = CGFloat(100 * (number - 4) + 50)
            position.y = CGFloat(100 * 1 + 50)
        case 8...11:
            position.x = CGFloat(100 * (number - 8) + 50)
            position.y = CGFloat(100 * 2 + 50)
        case 12...15:
            position.x = CGFloat(100 * (number - 12) + 50)
            position.y = CGFloat(100 * 3 + 50)
        default:
            position.x = 0
            position.y = 0
        }
        return position
    }
    
    func createPartsOfImage(){
        var number:Int = 0
        for row in 0...3{
            for col in 0...3{
                arr.append(Person(number: number, name: "\(number + 1)"))
                number += 1
            }
        }
    }
    
    private func findPartByPosition(location:CGPoint) -> Person?{
        let col = Int(location.x / 100)
        let row = Int(location.y / 100)
        let person = arr.first(where: { $0.position.x == col && $0.position.y == row })
        return person
        
    }
    func replaced(){
        let startIndex = arr.firstIndex(of: startPerson!)!
        /*
        let i = arr[startIndex]
        let j = arr[arr.count - 1]
        print("before \(arr[startIndex]) \(arr[arr.count - 1])")
        arr[startIndex].number = j.number
        arr[arr.count - 1].number = i.number
        arr.sort(by: { $0.number < $1.number})
        print("after \(arr[startIndex]) \(arr[arr.count - 1])")
         */
        print(arr[startIndex].number)
        arr[startIndex].number += 1
        print(arr[startIndex].number)
        
    }
    
    /*
    func replaced(){
        let startIndex = arr.firstIndex(of: startPerson!)!
        let lastIndex = arr.firstIndex(of: endPerson!)!
        let i = arr[startIndex]
        let j = arr[lastIndex]
        arr[startIndex].position = endPerson!.position
        arr[lastIndex].position = startPerson!.position
    }
    */
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
