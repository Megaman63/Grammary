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
    case added(T)
    case updated(T, changes: [PropertyChange])
    case error(Error)
}

typealias PrimaryKeyObserverBlock<T: RealmSwift.Object> = (PrimaryKeyObserverNotification<T>) -> Void

protocol PrimaryKeyObservable: PersistenceAgent {
    associatedtype ObjectType: RealmSwift.Object
    func switchToken(_ token: NotificationToken, forId: String)
}

extension PrimaryKeyObservable {
    
    func observe(id: String, block: @escaping PrimaryKeyObserverBlock<ObjectType>) -> NotificationToken {
        if let object = getRealm().object(ofType: ObjectType.self, forPrimaryKey: id) {
            return observe(existedObject: object, id: id, block: block)
        } else {
            return observeCollection(forId: id, block: block)
        }
    }
    
    // MARK: - Private functions
    
    private func observe(existedObject: ObjectType,
                         id: String,
                         block: @escaping PrimaryKeyObserverBlock<ObjectType>) -> NotificationToken {
        
        return existedObject.observe { [weak self] objectChange in
            guard let `self` = self else {
                return
            }
            switch objectChange {
            case .error(let error):
                block(.error(error))
            case .deleted:
                block(.deleted)
            case .change(let changes):
                guard let updatedObject = self.getRealm().object(ofType: ObjectType.self, forPrimaryKey: id) else {
                    fatalError("Recieved .change, but object doesn't exist")
                }
                block(.updated(updatedObject, changes: changes))
            }
        }
    }
    
    private func observeCollection(forId id: String,
                                   block: @escaping PrimaryKeyObserverBlock<ObjectType>) -> NotificationToken {
        
        guard let primaryKey = ObjectType.primaryKey() else {
            fatalError("This function can be used only with object which have primaryKey")
        }
        
        let predicate = NSPredicate(format: primaryKey + " == \(id)")
        return getRealm()
            .objects(ObjectType.self)
            .filter(predicate)
            .observe { [weak self] changes in
                switch changes {
                case .error(let error):
                    block(.error(error))
                case .initial(let objects):
                    guard let object = objects.first else {
                        return
                    }
                    block(.added(object))
                case .update(let objects, let deletions, let insertions, let modifications):
                    guard let object = objects.first, let self = self else {
                        return
                    }
                    assert(deletions.isEmpty, "There should ba subscription by object")
                    assert(modifications.isEmpty, "There should ba subscription by object")
                    assert(insertions.count == 1, "After object has been added, we should resubscribe by onject")
                    
                    block(.added(object))
                    let newToken = self.observe(existedObject: object, id: id, block: block)
                    self.switchToken(newToken, forId: id)
                }
        }
    }
}
