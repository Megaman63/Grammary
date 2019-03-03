//
//  DashboardState.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct DashboardState {
    let userName: String?
    let totalProgress: Double
    let totalCountOfDays: Int
    let totalExerciseTime: Double
    let totalCountOfCompletedRules: Int
    
    let reviseRecommendation: ReviseRecommendation
    
    let isDay: Bool
    
    let nextReviseRecommendedRulesSetId: String?
}
