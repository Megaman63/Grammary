//
//  ReviseRecommendation.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

enum ReviseRecommendation {
    case notStartedYet
    case relax(nextRevise: String)
    case urgentRevise
    case reviseIsNeeded
    
    // MARK: - Init
    
    init(reviseRecommendationDate date: Date?) {
        guard let date = date else {
            self = .notStartedYet
            return
        }
        
        let calendar = Calendar.current
        
        if calendar.isDateInYesterday(date) {
            self = .urgentRevise
        }
        else if calendar.isDateInToday(date) {
            self = .reviseIsNeeded
        }
        else if calendar.isDateInTomorrow(date) {
            self = .relax(nextRevise: "Завтра")
        } else {
            let startOfNow = calendar.startOfDay(for: Date())
            let startOfTimeStamp = calendar.startOfDay(for: date)
            let components = calendar.dateComponents([.day], from: startOfNow, to: startOfTimeStamp)
            let day = components.day!
            
            switch day {
            case let day where day < 1:
                self = .urgentRevise
            case 1:
                self = .reviseIsNeeded
            case let day where day > 1:
                self = .relax(nextRevise: "Через \(day) " + day.getDayEnding())
            default:
                self = .urgentRevise
            }
        }
    }
    
    // MARK: - Public properties
    
    var dateString: String {
        switch self {
        case .relax(let nextRevise):
            return nextRevise
        case .reviseIsNeeded:
            return "Сегодня"
        case .urgentRevise, .notStartedYet:
            return ""
        }
    }
    
    var labelString: String {
        switch self {
        case .notStartedYet:
            return "Вы еще не начали тренировки"
        case .relax:
            return "Отдыхайте, тренировка"
        case .reviseIsNeeded:
            return "Следующая тренировка"
        case .urgentRevise:
            return "Необходимо срочно повторить"
        }
    }
}

extension Int {
    func getDayEnding() -> String {
        switch self {
        case 11, 12, 13, 14:
            return "дней"
        default:
            if let lastDigitChat = String(self).last, let lastDigit = Int(String(lastDigitChat)) {
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
    
    func getRuleEnding() -> String {
        switch self {
        case 11, 12, 13, 14:
            return "правил"
        default:
            if let lastDigitChat = String(self).last, let lastDigit = Int(String(lastDigitChat)) {
                switch lastDigit {
                case 1:
                    return "правило"
                case 2,3,4:
                    return "правила"
                default:
                    return "правил"
                }
            } else {
                return "правил"
            }
        }
    }
    
    func getHourEnding() -> String {
        switch self {
        case 11, 12, 13, 14:
            return "час"
        default:
            if let lastDigitChat = String(self).last, let lastDigit = Int(String(lastDigitChat)) {
                switch lastDigit {
                case 1:
                    return "час"
                case 2,3,4:
                    return "часа"
                default:
                    return "часов"
                }
            } else {
                return "часов"
            }
        }
    }
    
    func getMinutesEnding() -> String {
        switch self {
        case 11, 12, 13, 14:
            return "минут"
        default:
            if let lastDigitChat = String(self).last, let lastDigit = Int(String(lastDigitChat)) {
                switch lastDigit {
                case 1:
                    return "минута"
                case 2,3,4:
                    return "минуты"
                default:
                    return "минут"
                }
            } else {
                return "минут"
            }
        }
    }
}
