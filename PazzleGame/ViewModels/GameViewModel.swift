//
//  GameViewModel.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 01.03.2023.
//

import SwiftUI

enum GameStatus:String{
    case win = "levelCompleted"
    case lose = "levelFailed"
    case inProgress = "inProgress"
}

class GameViewModel: ObservableObject{
    @Published var partsOfImage:[CGImage] = []
    @Published var startIndex:Int? = nil
    @Published var endIndex:Int? = nil
    @Published var gameStatus:GameStatus = .inProgress
    @Published var value:Int = 0
    @Published var finalTime:Int = 0
    var standartParts:[CGImage] = []
    var level:Level? = nil
    var time:Int = 0
    var timer:Timer!
    var timerIsEnd:Bool = false
    
    var countdown:Int{
        time - value
    }
    
    func loadLevel(level:Level){
        self.level = level
        time = level.executionTime
        createPartsOfImage()
        createTimer()
    }
    
    func createTimer(){
        timer = nil
        timer = Timer(timeInterval: 1, target: self, selector: #selector(changeTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
        timer.fire()
    }
    
    @objc
    func changeTimer(){
        self.value += 1
        print(value)
        if self.countdown <= 0{
            timerIsEnd = true
            gameStatus = .lose
            resetTimer()
        }
    }
    
    func resetTimer(){
        if timer != nil {
            timer.invalidate()
        }
        timer = nil
        value = 0
    }
    
    func gameLosed(){
        timerIsEnd = true
        gameStatus = .lose
        resetTimer()
    }
    
    func createPartsOfImage(){
        guard let uiImage = UIImage(named: level!.image) else { return }
        standartParts.removeAll()
        for row in 0...3{
            for col in 0...3{
                let crop = CGRect(x: (uiImage.size.width / 4) * CGFloat(col), y: (uiImage.size.height / 4) * CGFloat(row), width: uiImage.size.width / 4, height: uiImage.size.height / 4)
                if let croppedImage:CGImage = uiImage.cgImage?.cropping(to: crop) {
                    standartParts.append(croppedImage)
                }
            }
        }
        shuffledParts()
    }
    
    func shuffledParts(){
        partsOfImage = standartParts.shuffled()
    }
    
    func replaced(){
        if startIndex != nil && endIndex != nil{
            if startIndex! <= partsOfImage.count - 1 && endIndex! <= partsOfImage.count - 1{
                partsOfImage.swapAt(startIndex!, endIndex!)
            }
        }
        checkCoincidence()
    }
    
    func checkCoincidence(){
        if standartParts == partsOfImage{
            gameStatus = .win
            level!.changeToCompleted()
            level!.setBestTime(newTime: value)
            finalTime = value
            resetTimer()
        }
    }
    
    func startOver(){
        shuffledParts()
        if timer != nil{
            value = 0
        } else {
            createTimer()
        }
    }
    
}
