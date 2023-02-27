//
//  LevelViewModel.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import SwiftUI
import RealmSwift

class LevelViewModel:ObservableObject{
    @Published var levels:[Level] = []
    
    init(){
        getLevels()
        if levels.isEmpty{
            createLevels()
        }
    }
    
    func getLevels(){
        guard let realm = try? Realm() else { return }
        levels = realm.objects(Level.self).map({ $0 })
    }
    
    func createLevels(){
        var executionTime:Int = 175
        for level in 1...12{
           let newLevel = Level()
            newLevel.executionTime = executionTime
            executionTime -= 5
            newLevel.number = level
            newLevel.image = "previewLevel\(level)"
            if level == 1{
                newLevel.isLocked = false
            }
            addToRealm(object: newLevel)
        }
        getLevels()
    }
    
    private func addToRealm(object:Object){
        do{
            let realm = try Realm()
            try realm.write({
                realm.add(object)
            })
        } catch{
            print(error.localizedDescription)
        }
    }
}
