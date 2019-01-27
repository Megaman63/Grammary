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
    
    func rulesSetNotificationCenter(_ center: RulesSetNotificationCenter,
                                    didChangeRulesSet changes: PrimaryKeyObserverNotification<RulesSet>)
}

protocol RulesSetNotificationCenter: AnyObject {
    func subscribeOnAllRulesSets(subscriber: RulesSetNotificationCenterDelegate)
    func unsubscribeFromAllRulesSets(subscriber: RulesSetNotificationCenterDelegate)
    
    func subscribeOnOneRulesSet(withId id: String, subscriber: RulesSetNotificationCenterDelegate)
    func unsubscribeFromOneRulesSet(ruleSetId: String, subscriber: RulesSetNotificationCenterDelegate)
}

final class RulesSetNotificationCenterImpl: PersistenceAgent, PrimaryKeyObservable, RulesSetNotificationCenter {
    
    // MARK: - Private properties
    
    private let allSetsDelegates = MulticastDelegate<RulesSetNotificationCenterDelegate>()
    private var allSetsToken: NotificationToken?
    private var oneSetTokens = NotificationCenterTokenCollection<RulesSetNotificationCenterDelegate>()
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - RulesSetNotificationCenter
    
    func subscribeOnAllRulesSets(subscriber: RulesSetNotificationCenterDelegate) {
        allSetsDelegates.register(subscriber)
        guard allSetsToken == nil else {
            return
        }
        allSetsToken = getRealm().objects(RulesSet.self).observe { [weak self] changes in
            guard let `self` = self else {
                return
            }
            self.allSetsDelegates.invoke { $0.rulesSetNotificationCenter(self, didChangeRulesSets: changes)}
        }
    }
    
    func unsubscribeFromAllRulesSets(subscriber: RulesSetNotificationCenterDelegate) {
        allSetsDelegates.unregister(subscriber)
        if allSetsDelegates.isEmpty {
            allSetsToken?.invalidate()
            allSetsToken = nil
        }
    }
    
    func subscribeOnOneRulesSet(withId id: String, subscriber: RulesSetNotificationCenterDelegate) {
        if let token = oneSetTokens[id] {
            token.delegates.register(subscriber)
            return
        }
        
        let token = observe(id: id) { [weak self] changes in
            guard let `self` = self, let delegates = self.oneSetTokens[id]?.delegates else {
                return
            }
            delegates.invoke { $0.rulesSetNotificationCenter(self, didChangeRulesSet: changes)}
        }
        oneSetTokens[id] = NotificationCenterToken(id: id, token: token)
    }
    
    func unsubscribeFromOneRulesSet(ruleSetId: String, subscriber: RulesSetNotificationCenterDelegate) {
        oneSetTokens.remove(subscriber: subscriber, forId: ruleSetId)
    }
    
    // MARK: - PrimaryKeyObservable
    
    typealias ObjectType = RulesSet
    
    func switchToken(_ token: NotificationToken, forId id: String) {
        oneSetTokens[id]?.token.invalidate()
        oneSetTokens[id]?.token = token
    }
}
