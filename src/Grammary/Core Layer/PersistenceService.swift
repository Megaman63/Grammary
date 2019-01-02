//
//  PersistenceService.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

protocol PersistenceService: AnyObject {
    
}

extension PersistenceService {
    func getRealm() -> Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Could not obtain Realm instance \(error)")
        }
    }
    
    func write(_ block: () -> Void) {
        do {
            let realm = try Realm()
            try realm.write(block)
        } catch {
            fatalError("Could not write \(error)")
        }
    }
}
