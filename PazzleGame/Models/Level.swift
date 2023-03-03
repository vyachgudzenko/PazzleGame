//
//  Level.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 27.02.2023.
//

import Foundation
import RealmSwift

class Level:Object,ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var number:Int = 0
    @Persisted var image:String = ""
    @Persisted var executionTime:Int = 0
    @Persisted var isCompleted:Bool = false
    @Persisted var isLocked:Bool = true
    @Persisted var bestTime:Int = 0
    
    func changeToCompleted(){
        do {
            let realm = try Realm()
            try realm.write({
                self.isCompleted = true
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setBestTime(newTime:Int){
        if newTime < self.bestTime{
            do{
               let realm = try Realm()
                try realm.write({
                    self.bestTime = newTime
                })
            } catch{
                print(error.localizedDescription)
            }
        }
    }
}
