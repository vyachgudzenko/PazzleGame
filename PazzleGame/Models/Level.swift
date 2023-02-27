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
}
