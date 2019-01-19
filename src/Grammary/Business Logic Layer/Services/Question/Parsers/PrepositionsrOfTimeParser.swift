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
        ruleDescription: "Prepositions of time: In",
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
                    Answer(id: "p-t-in-0-2", text: "с конкретным временем (в 5 часов, в полночь, в полдень)"),
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
                    Answer(id: "p-t-in-1-2", text: "с конкретным временем (в 5 часов, в полночь, в полдень)"),
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
    
    let atPreposition = Rule(
        id: "p-t-at",
        ruleDescription: "Prepositions of time: At",
        questions: [
            Question(
                id: "p-t-at-0",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-at-0-0", text: "с конкретным временем (в 5 часов, в полночь, в полдень)"),
                    Answer(id: "p-t-at-0-1", text: "с месяцами (в январе)"),
                    Answer(id: "p-t-at-0-2", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-at-0-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I heard a strange noise at midnight. – В полночь я услышала странный звук."),
                    RuleExample(text: "I will arrive at 5 o'clock.")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-at-1",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-at-1-0", text: "с праздниками (на Рождество)"),
                    Answer(id: "p-t-at-1-1", text: "с временами года (летом)"),
                    Answer(id: "p-t-at-1-2", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-at-1-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I will go abroad at the weekend. – На выходных я поеду за границу."),
                    RuleExample(text: "We give presents each other at the New Year")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-at-2",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-at-2-0", text: "с выражениями в настоящий момент/ночью/в полдень/в полуденное время"),
                    Answer(id: "p-t-at-2-1", text: "с годами (в 1999 году)"),
                    Answer(id: "p-t-at-2-2", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-at-2-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I'll ring back at midday."),
                    RuleExample(text: "He'll come at noon.")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-at-3",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-at-3-0", text: "Когда говорим о начале и конце периода: в начале/в конце"),
                    Answer(id: "p-t-at-3-1", text: "с годами (в 1999 году)"),
                    Answer(id: "p-t-at-3-2", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-at-3-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "She is moving in at the beginning of January. – Она въезжает в начале января.")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-at-4",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-at-4-0", text: "cо словами, обозначающими время принятия пищи: за завтраком/за обедом/за ужином."),
                    Answer(id: "p-t-at-4-1", text: "с годами (в 1999 году)"),
                    Answer(id: "p-t-at-4-2", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-at-4-3", text: "с датами (29-ого мая)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Didn’t you eat enough at breakfast? – Ты что, не наелся за завтраком?")
                    ].toRealmList()
            ),
            
            
            ].toRealmList()
    )
    
    let onPreposition = Rule(
        id: "p-t-on",
        ruleDescription: "Prepositions of time: On",
        questions: [
            Question(
                id: "p-t-on-0",
                ruleTitle: "Предлог on уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-on-0-0", text: "с датами (29-ого мая)"),
                    Answer(id: "p-t-on-0-1", text: "с месяцами (в январе)"),
                    Answer(id: "p-t-on-0-2", text: "с конкретным временем (в 5 часов, в полночь, в полдень)"),
                    Answer(id: "p-t-at-0-3", text: "с выражениями в настоящий момент/ночью/в полдень/в полуденное время"),
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "My birthday is on the 16th of May")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-on-1",
                ruleTitle: "Предлог on уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-on-1-0", text: "с днями недели (в пятницу"),
                    Answer(id: "p-t-on-1-1", text: "с праздниками (на Рождество)"),
                    Answer(id: "p-t-on-1-2", text: "с с временами года (летом)"),
                    Answer(id: "p-t-on-1-3", text: "с годами (в 1999 году)"),
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "My next lesson is on Friday. – Мой следующий урок в пятницу.")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-on-2",
                ruleTitle: "Предлог on уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-on-2-0", text: "с прилагательным + day"),
                    Answer(id: "p-t-on-2-1", text: "с годами (в 1999 году)"),
                    Answer(id: "p-t-on-2-2", text: "с месяцами (в январе)"),
                    Answer(id: "p-t-on-2-3", text: "с конкретным временем (в 5 часов, в полночь, в полдень)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "On a rainy day"),
                    RuleExample(text: "On a cold day")
                    ].toRealmList()
            ),
            Question(
                id: "p-t-on-2",
                ruleTitle: "Предлог on уоптребляется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-t-on-2-0", text: "с с определенной частью дня"),
                    Answer(id: "p-t-on-2-1", text: "с конкретным временем (в 5 часов, в полночь, в полдень)"),
                    Answer(id: "p-t-on-2-2", text: "с временами года (летом)"),
                    Answer(id: "p-t-on-2-3", text: "с месяцами (в январе)")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I am meeting my friends on Friday evening.")
                    ].toRealmList()
            )
            ].toRealmList()
    )
    
    
    return [inPreposition, atPreposition, onPreposition]
}
