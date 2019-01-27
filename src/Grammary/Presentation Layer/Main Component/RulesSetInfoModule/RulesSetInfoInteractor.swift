//
//  RulesSetInfoInteractor.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetInfoInteractorImpl: RulesSetInfoInteractor {

    weak var output: RulesSetInfoInteractorOutput?

    private let rulesSetNotificationCenter: RulesSetNotificationCenter
    
    init(rulesSetNotificationCenter: RulesSetNotificationCenter) {
        self.rulesSetNotificationCenter = rulesSetNotificationCenter
    }
    
    // MARK: - RulesSetInfoInteractor
    
    func subscribeOnRuleSet(withId id: String) {
        rulesSetNotificationCenter.subscribeOnOneRulesSet(withId: id, subscriber: self)
    }
}

extension RulesSetInfoInteractorImpl: RulesSetNotificationCenterDelegate {

    // MARK: - RulesSetNotificationCenterDelegate
    
    func rulesSetNotificationCenter(_ center: RulesSetNotificationCenter,
                                    didChangeRulesSet changes: PrimaryKeyObserverNotification<RulesSet>) {
        output?.didChangeRulesSet(changes: changes)
    }
    
    func rulesSetNotificationCenter(_ center: RulesSetNotificationCenter,
                                    didChangeRulesSets changes: RulesSetNotification) { }
}
