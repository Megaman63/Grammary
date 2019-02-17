//
//  PrepositionsOfPlaceParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parsePlacePrepositions() -> [Rule] {
    let placePrepositions = Rule(
        id: "p-p-all",
        ruleDescription: "Prepositions of place",
        questions: [
            Question(
                id: "p-p-in-0",
                ruleTitle: "Предлог in уоптребляется",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-p-in-0-0", text: "когда мы хотим указать, что объект находится внутри другого, большего объекта"),
                    Answer(id: "p-p-in-0-1", text: "когда предмет соприкасается с плоской поверхностью"),
                    Answer(id: "p-p-in-0-2", text: "когда мы говорим о каком-либо конкретном месте, пункте или ориентире, а не о территории либо площади в целом")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Let’s go for a walk in the woods. – Пойдем на прогулку в лес."),
                    RuleExample(text: "My keys are in my bag. – Мои ключи в сумке.")
                    ].toRealmList()
            ),
            Question(
                id: "p-p-at-0",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-p-at-0-0", text: "когда мы говорим о каком-либо конкретном месте, пункте или ориентире, а не о территории либо площади в целом"),
                    Answer(id: "p-p-at-0-1", text: "когда мы хотим указать, что объект находится внутри другого, большего объекта"),
                    Answer(id: "p-p-at-0-2", text: "когда предмет соприкасается с плоской поверхностью")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "There were a lot of people at a conference. – На конференции было много людей."),
                    RuleExample(text: "I met him at Jack’s party. – Я познакомилась с ним у Джека на вечеринке.")
                    ].toRealmList()
            ),
            Question(
                id: "p-p-at-1",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-p-at-1-0", text: "когда говорите о зданиях как об определенных пунктах или ориентирах"),
                    Answer(id: "p-p-at-2-1", text: "когда мы хотим указать, что объект находится внутри другого, большего объекта"),
                    Answer(id: "p-p-at-3-2", text: "когда предмет соприкасается с плоской поверхностью")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I stopped at the shop on my way home. – Я остановилась у магазина по пути домой")
                    ].toRealmList()
            ),
            Question(
                id: "p-p-at-1",
                ruleTitle: "Предлог at уоптребляется",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-p-at-1-0", text: "перед адресами"),
                    Answer(id: "p-p-at-2-1", text: "когда мы хотим указать, что объект находится внутри другого, большего объекта"),
                    Answer(id: "p-p-at-3-2", text: "когда предмет соприкасается с плоской поверхностью")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Their shop is at 35 Park Road. – Их магазин на Парк Роад 35.")
                    ].toRealmList()
            ),
            Question(
                id: "p-p-on-0",
                ruleTitle: "Предлог on уоптребляется",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-p-on-0-0", text: "когда предмет соприкасается с плоской поверхностью"),
                    Answer(id: "p-p-on-0-1", text: "когда мы хотим указать, что объект находится внутри другого, большего объекта"),
                    Answer(id: "p-p-on-0-2", text: "когда мы говорим о каком-либо конкретном месте, пункте или ориентире, а не о территории либо площади в целом")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "on the ceiling – на потолке, on the wall – на стене, on the floor – на полу")
                    ].toRealmList()
            ),
            Question(
                id: "p-p-on-1",
                ruleTitle: "Предлог on уоптребляется",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-p-on-1-0", text: "когда говорим о реке или о дороге"),
                    Answer(id: "p-p-on-1-1", text: "перед адресами"),
                    Answer(id: "p-p-on-1-2", text: "когда мы говорим о каком-либо конкретном месте, пункте или ориентире, а не о территории либо площади в целом")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "They built the house on the Humber River. – Они построили дом на реке Хамбер.")
                    ].toRealmList()
            ),
            Question(
                id: "p-p-on-2",
                ruleTitle: "Предлог on уоптребляется",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "p-p-on-2-0", text: "когда говорим о передвижениях на автобусе, поезде, самолете"),
                    Answer(id: "p-p-on-2-1", text: "перед адресами"),
                    Answer(id: "p-p-on-2-2", text: "когда мы говорим о каком-либо конкретном месте, пункте или ориентире, а не о территории либо площади в целом")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "English people read newspapers everywhere, even on the bus. – Англичане читают газеты везде, даже в автобусе.")
                    ].toRealmList()
            ),
            ].toRealmList()
    )
    return [placePrepositions]
}
