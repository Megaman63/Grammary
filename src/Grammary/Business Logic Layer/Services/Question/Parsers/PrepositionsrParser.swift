//
//  WouldRatherParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/12/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func timePrepositions() -> [Rule] {
    
    let inPreposition = Rule(
        id: "p-t-in",
        ruleDescription: "Prepositions of time",
        questions: [
            Question(
                id: "p-t-in-0",
                ruleTitle: "Предлог in уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-in-0-0", text: "с месяцами (в январе)"),
                    Answer(id: "p-t-in-0-1", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-in-0-2", text: "с временем (в 5 часов)"),
                    Answer(id: "p-t-in-0-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I was born in May. – Я родилась в мае.")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-in-1",
                ruleTitle: "Предлог in уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-in-1-0", text: "с с временами года (летом)"),
                    Answer(id: "p-t-in-1-1", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-in-1-2", text: "с временем (в 5 часов)"),
                    Answer(id: "p-t-in-1-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "In the summer of 2009, Honduras went through a wrenching constitutional crisis.")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-in-2",
                ruleTitle: "Предлог in уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-in-2-0", text: "с годами (в 1999 году)"),
                    Answer(id: "p-t-in-2-1", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-in-2-2", text: "с праздниками (на Рождество)"),
                    Answer(id: "p-t-in-2-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "She was in Italy in 1997")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-in-3",
                ruleTitle: "Предлог in уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-in-3-0", text: "с веками (в 21 веке)"),
                    Answer(id: "p-t-in-3-1", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-in-3-2", text: "с праздниками (на Рождество)"),
                    Answer(id: "p-t-in-3-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "World war 2 was in 20 century")
                    ].toRealmList()
            )
            ].toRealmList()
    )
    
    
    
    
    return [inPreposition]
}
