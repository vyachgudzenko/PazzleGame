//
//  Int.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 01.03.2023.
//

import Foundation

extension Int{
    var timeLeft:String{
        
        var minute:String = ""
        var second:String = ""
        if self / 60 < 10{
            minute = "0\(self / 60)"
        } else {
            minute = "\(self / 60)"
        }
        if self % 60 < 10 {
            second = "0\(self % 60)"
        } else {
            second = "\(self % 60)"
        }
        return minute + ":" + second
    }
}
