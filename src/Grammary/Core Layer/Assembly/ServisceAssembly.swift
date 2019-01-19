//
//  ServiceAssembly.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation

protocol ServiceAssembly: AnyObject {
    func getUpdateFacade() -> UpdatesFacade
    func getExerciseFacade() -> ExerciseFacade
    func getProgressFacade() -> ProgressFacade
    
    var rulesSetNotificationCenter: RulesSetNotificationCenter { get }
}

final class ServiceAssemblyImpl: ServiceAssembly {
    
    // MARK: - ServiceAssembly
    
    func getUpdateFacade() -> UpdatesFacade {
        return UpdatesFacadeImpl(ruleLocalService: RuleLocalServiceImpl(),
                                 rulesSetLocalService: RulesSetLocalServiceImpl())
    }
    
    func getExerciseFacade() -> ExerciseFacade {
        return ExerciseFacadeImpl(ruleLocalService: RuleLocalServiceImpl(),
                                  rulesSetLocalService: RulesSetLocalServiceImpl(),
                                  ruleProgressLocalService: RuleProgressLocalServiceImpl())
    }
    
    func getProgressFacade() -> ProgressFacade {
        return ProgressFacadeImpl(ruleLocalService: RuleLocalServiceImpl(),
                                  rulesSetLocalService: RulesSetLocalServiceImpl(),
                                  ruleProgressLocalService: RuleProgressLocalServiceImpl())
    }
    
    lazy var rulesSetNotificationCenter: RulesSetNotificationCenter = RulesSetNotificationCenterImpl()
}
