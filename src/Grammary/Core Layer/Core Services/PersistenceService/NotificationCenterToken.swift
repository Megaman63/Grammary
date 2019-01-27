//
//  NotificationCenterToken.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/27/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import RealmSwift

struct NotificationCenterToken<T> {
    let id: String
    var token: NotificationToken
    let delegates = MulticastDelegate<T>()
}

struct NotificationCenterTokenCollection<T> {
    private var collection: [NotificationCenterToken<T>] = []
    
    subscript(_ id: String) -> NotificationCenterToken<T>? {
        get {
            return collection.first(where: { $0.id == id })
        }
        set {
            guard let newValue = newValue else {
                if let index = collection.index(where: { $0.id == id }) {
                    collection.remove(at: index)
                }
                return
            }
            if let index = collection.index(where: { $0.id == id }) {
                collection[index] = newValue
            } else {
                collection.append(newValue)
            }
        }
    }
    
    mutating func remove(subscriber: T, forId id: String) {
        guard let token = self[id] else {
            return
        }
        token.delegates.unregister(subscriber)
        if token.delegates.isEmpty {
            token.token.invalidate()
            self[id] = nil
        }
    }
    
    mutating func checkSubscribers(forId id: String) {
        guard let token = self[id], token.delegates.isEmpty else {
            return
        }
        token.token.invalidate()
        self[id] = nil
    }
}
