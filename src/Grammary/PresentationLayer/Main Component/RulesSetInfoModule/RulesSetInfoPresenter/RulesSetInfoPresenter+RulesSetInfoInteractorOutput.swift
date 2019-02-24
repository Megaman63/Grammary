//
//  RulesSetInfoPresenter+RulesSetInfoInteractorOutput.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension RulesSetInfoPresenterImpl: RulesSetInfoInteractorOutput {

    // MARK: - RulesSetInfoInteractorOutput

    func didChangeRulesSet(changes: PrimaryKeyObserverNotification<RulesSet>) {
        switch changes {
        case .deleted:
            router.dismissView()
        case .error(let error):
            printError(error)
        case .initial(let rulesSet), .updated(let rulesSet):
            buildSection(forRulesSet: rulesSet)
        }
    }
    
    // MARK: - Private functions
    
    private func buildSection(forRulesSet rulesSet: RulesSet) {
        state.sections = []
        
        var totalProgress = 0.0
        rulesSet.progress.forEach { totalProgress = totalProgress + $0.percentOfProgress }
        totalProgress = totalProgress / Double(rulesSet.progress.count)
        
        let headerItem = RulesSetHeaderItem(
            title: rulesSet.name,
            description: rulesSet.setDescription,
            totalProgress: totalProgress,
            reviseRecommendation: getReviseRecommendation(date: rulesSet.nextReviseRecommendedDate)
        )
        view?.configure(headerItem: headerItem)
        
        let ruleItems: [RuleProgressItem] = rulesSet
            .progress
            .enumerated()
            .map { (index, progress) -> RuleProgressItem in
                RuleProgressItem(name: progress.rule?.ruleDescription ?? "",
                                 errorCount: progress.errorCount,
                                 correctAnswers: progress.progress,
                                 index: index)
        }
        
        let items: [CollectionViewItem] = ruleItems
        state.sections = [CommonAnyTypeCollectionViewSection(items: items, didSelectItem: nil)]
        view?.set(dataSource: state.sections)
    }
    
    private func getReviseRecommendation(date: Date) -> ReviseRecommendation {
        let calendar = Calendar.current

        if calendar.isDateInYesterday(date) {
            return .urgentRevise
        }
        else if calendar.isDateInToday(date) {
            return .reviseIsNeeded
        }
        else if calendar.isDateInTomorrow(date) {
            return .relax(nextRevise: "Завтра")
        } else {
            let startOfNow = calendar.startOfDay(for: Date())
            let startOfTimeStamp = calendar.startOfDay(for: date)
            let components = calendar.dateComponents([.day], from: startOfNow, to: startOfTimeStamp)
            let day = components.day!
            
            switch day {
            case let day where day < 1:
                return .urgentRevise
            case 1:
                return .reviseIsNeeded
            case let day where day > 1:
                return .relax(nextRevise: "Через \(day) " + getDayEnding(day: day))
            default:
                return .urgentRevise
            }
        }
    }
    
    func getDayEnding(day: Int) -> String {
        switch day {
        case 11, 12, 13, 14:
            return "дней"
        default:
            if let lastDigitChat = String(day).last, let lastDigit = Int(String(lastDigitChat)) {
                switch lastDigit {
                case 1:
                    return "день"
                case 2,3,4:
                    return "дня"
                default:
                    return "дней"
                }
            } else {
                return "дней"
            }
        }
    }
}

enum ReviseRecommendation {
    case relax(nextRevise: String)
    case urgentRevise
    case reviseIsNeeded
    
    var dateString: String {
        switch self {
        case .relax(let nextRevise):
            return nextRevise
        case .reviseIsNeeded:
            return "Сегодня"
        case .urgentRevise:
            return ""
        }
    }
    
    var labelString: String {
        switch self {
        case .relax:
            return "Отдыхайте, тренировка"
        case .reviseIsNeeded:
            return "Следующая тренировка"
        case .urgentRevise:
            return "Необходимо срочно повторить"
        }
    }
}
