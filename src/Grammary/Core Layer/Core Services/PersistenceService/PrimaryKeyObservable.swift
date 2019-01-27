//
//  PrimaryKeyObservable.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/27/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import RealmSwift

enum PrimaryKeyObserverNotification<T: RealmSwift.Object> {
    case deleted
    case initial(T)
    case updated(T)
    case error(Error)
}

typealias PrimaryKeyObserverBlock<T: RealmSwift.Object> = (PrimaryKeyObserverNotification<T>) -> Void

protocol PrimaryKeyObservable: PersistenceAgent {
    associatedtype ObjectType: RealmSwift.Object
}

extension PrimaryKeyObservable {
    
    func observe(id: String, block: @escaping PrimaryKeyObserverBlock<ObjectType>) -> NotificationToken {
        return observeCollection(forId: id, block: block)
    }
    
    // MARK: - Private functions
    
    private func observeCollection(forId id: String,
                                   block: @escaping PrimaryKeyObserverBlock<ObjectType>) -> NotificationToken {
        
        guard let primaryKey = ObjectType.primaryKey() else {
            fatalError("This function can be used only with object which have primaryKey")
        }
        
        let predicate = NSPredicate(format: primaryKey + " == \"\(id)\"")
        return getRealm()
            .objects(ObjectType.self)
            .filter(predicate)
            .observe { changes in
                switch changes {
                case .error(let error):
                    block(.error(error))
                case .initial(let objects):
                    guard let object = objects.first else {
                        return
                    }
                    block(.initial(object))
                case .update(let objects, let deletions, let insertions, let modifications):
                    guard let object = objects.first else {
                        if deletions.count == 1 {
                            block(.deleted)
                        } else {
                            assertionFailure()
                        }
                        return
                    }
                    if insertions.count == 1 {
                        block(.initial(object))
                        assert(deletions.isEmpty)
                        assert(modifications.isEmpty)
                        return
                    }
                    if modifications.count == 1 {
                        block(.updated(object))
                        assert(deletions.isEmpty)
                        assert(insertions.isEmpty)
                        return
                    }
                    assertionFailure()
                }
        }
    }
}
