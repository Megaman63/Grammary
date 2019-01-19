//
//  RulesSetsInteractor+RulesSetNotificationCenterDelegate.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

extension RulesSetsInteractorImpl: RulesSetNotificationCenterDelegate {
    
    // MARK: - RulesSetNotificationCenterDelegate
    
    func rulesSetNotificationCenter(_ center: RulesSetNotificationCenter,
                                    didChangeRulesSets changes: RulesSetNotification) {

        output?.didChangeRulesSets(changes: changes)
    }
}
