//
//  RulesSetNotificationCenter.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import RealmSwift

typealias RulesSetNotification = RealmCollectionChange<Results<RulesSet>>

protocol RulesSetNotificationCenterDelegate: AnyObject {
    func rulesSetNotificationCenter(_ center: RulesSetNotificationCenter,
                                    didChangeRulesSets changes: RulesSetNotification)
}

protocol RulesSetNotificationCenter: AnyObject {
    func subscribeOnAllRulesSets(subscriber: RulesSetNotificationCenterDelegate)
    func unsubscribeFromAllRulesSets(subscriber: RulesSetNotificationCenterDelegate)
}

final class RulesSetNotificationCenterImpl: PersistenceService, RulesSetNotificationCenter {
    
    // MARK: - Private properties
    
    private var token: NotificationToken?
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - RulesSetNotificationCenter
    
    var delegates = MulticastDelegate<RulesSetNotificationCenterDelegate>()
    
    func subscribeOnAllRulesSets(subscriber: RulesSetNotificationCenterDelegate) {
        delegates.register(subscriber)
        guard token == nil else {
            return
        }
        token = getRealm().objects(RulesSet.self).observe { [weak self] changes in
            guard let `self` = self else {
                return
            }
            self.delegates.invoke { $0.rulesSetNotificationCenter(self, didChangeRulesSets: changes)}
        }
    }
    
    func unsubscribeFromAllRulesSets(subscriber: RulesSetNotificationCenterDelegate) {
        delegates.unregister(subscriber)
        if delegates.isEmpty {
            token?.invalidate()
            token = nil
        }
    }
}
