//
//  GameViewModel.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 01.03.2023.
//

import SwiftUI

class GameViewModel: ObservableObject{
    @Published var gameIsWin:Bool = false
    @Published var gameIsLose:Bool = false
    var level:Level? = nil
    @Published var value:Int = 0
    var time:Int = 0
    var timer:Timer!
    var timerIsEnd:Bool = false
    
    var countdown:Int{
        time - value
    }
    
    func loadLevel(level:Level){
        self.level = level
        time = level.executionTime
    }
    
    func createTimer(){
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
            gameIsLose = true
            resetTimer()
        }
    }
    
    func resetTimer(){
        timer.invalidate()
        timer = nil
        value = 0
    }
    
    
}
