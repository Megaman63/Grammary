//
//  PersistenceService.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

protocol PersistenceService: PersistenceAgent {
    associatedtype RealmObject: Object
    func update(_ object: RealmObject, _ block: ((RealmObject) -> Void)?)
    func update(_ objects: [RealmObject], _ block: (([RealmObject]) -> Void)?)
}

protocol PersistenceAgent: AnyObject {

}

extension PersistenceAgent {
    func getRealm() -> Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Could not obtain Realm instance \(error)")
        }
    }
    
    func write(_ block: CommonBlock) {
        do {
            let realm = try Realm()
            try realm.write(block)
        } catch {
            fatalError("Could not write \(error)")
        }
    }
}

extension PersistenceService {
    func update<T: Object>(_ object: T, _ block: ((T) -> Void)? = nil) {
        let realm = getRealm()
        try? realm.write {
            block?(object)
            realm.add(object, update: true)
        }
    }
    
    func update<T: Object>(_ objects: [T], _ block: (([T]) -> Void)? = nil) {
        let realm = getRealm()
        try? realm.write {
            block?(objects)
            realm.add(objects, update: true)
        }
    }
}
