//
//  SlotMachineData.swift
//  Slot Machine
//
//  Created by Jovi on 19/02/2023.
//

import Foundation
import RealmSwift

class SlotMachineData: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var highscore: Int?
    @Persisted var jackpot: Int?

    
    //function use to save this or self obj to realm database
    func create(){
        let realm = try! Realm()
        
        do {
          try realm.write {
            realm.add(self)
          }
        } catch {
            
        }
     
     }
     
     //function update obj in realm database
     func update(){
         let realm = try! Realm()
         try! realm.write {
             realm.add(self, update: .modified)
         }
     }
     
     //function use to delete obj from realm database
     func delete(){
         let realm = try! Realm()
         try! realm.write {
             realm.delete(self)
         }
     }
    
    //static function use to access data
    static func getData()->SlotMachineData?{
        let realm = try! Realm()
        let personalInfObjects = realm.objects(SlotMachineData.self)
        if(personalInfObjects.count > 0){
            return personalInfObjects[0]
        }
        else{
            var data = SlotMachineData()
            data.jackpot = 5000
            data.highscore = 0
            data.create()
            return data
        }
        return nil
        
    }
}
