//
//  AnswersParser.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

func parseConditional() -> [Rule] {
    let zero = Rule(
        id: "c-z",
        ruleDescription: "Zero Conditional",
        questions: [
            Question(
                id: "c-z-0",
                ruleTitle: "Zero conditional construction",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-0-0", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-z-0-1", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to"),
                    Answer(id: "c-z-0-2", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-z-0-3", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/should/might have have + past participle")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения Zero Conditional...",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-1-0", text: "всегда являются 100% истинной"),
                    Answer(id: "c-z-1-1", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-z-1-2", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-z-1-3", text: "выражают воображаемые ситуации, относящиеся к прошлому")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Zero Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-2-0", text: "Present Simple"),
                    Answer(id: "c-z-2-1", text: "Past Simple"),
                    Answer(id: "c-z-2-2", text: "Any future form + infinitive without to"),
                    Answer(id: "c-z-2-3", text: "would/could/might + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-3",
                ruleTitle: "Какая форма используется в If clause конуструкции Zero Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-3-0", text: "Present Simple"),
                    Answer(id: "c-z-3-1", text: "Past Simple"),
                    Answer(id: "c-z-3-2", text: "Past Perfect"),
                    Answer(id: "c-z-3-3", text: "would/could/might + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-4",
                ruleTitle: "Какой Conditional также используется для того, чтобы дать указания или инструкции?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-4-0", text: "Zero conditional"),
                    Answer(id: "c-z-4-1", text: "Second conditional"),
                    Answer(id: "c-z-4-2", text: "Third conditional"),
                    Answer(id: "c-z-4-3", text: "First conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you don’t want to be late, hurry up. – Если не хочешь опоздать, поторапливайся."),
                    RuleExample(text: "Take a nap if you feel tired. – Вздремни, если ты устал."),
                    ].toRealmList()
            )
            ].toRealmList()
    )
    let first = Rule(
        id: "c-f",
        ruleDescription: "First Conditional",
        questions: [
            Question(
                id: "c-f-0",
                ruleTitle: "First conditional construction",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-0-0", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to"),
                    Answer(id: "c-f-0-1", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-f-0-2", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-f-0-3", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/should/might have have + past participle")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-0-e",
                ruleTitle: "First Conditional sentences",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-0-e-0", text: "are used to talk about a possible present or future situation and its result"),
                    Answer(id: "c-f-0-e-1", text: "are used to talk about hypothetical or improbable situations in the present or future"),
                    Answer(id: "c-f-0-e-2", text: "are used to talk about a hypothetical situation in the past")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "They won’t get a table unless they’ve already booked."),
                    RuleExample(text: "Can I borrow your dictionary for a moment if you’re not using it?"),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения First Conditional...",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-1-0", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-f-1-1", text: "всегда являются 100% истинной"),
                    Answer(id: "c-f-1-2", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-f-1-3", text: "выражают воображаемые ситуации, относящиеся к прошлому")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции First Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-2-0", text: "Any future form + infinitive without to"),
                    Answer(id: "c-f-2-1", text: "Present Simple"),
                    Answer(id: "c-f-2-2", text: "Past Simple"),
                    Answer(id: "c-f-2-3", text: "would/could/might + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-3",
                ruleTitle: "Какая форма используется в If clause конуструкции First Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-3-0", text: "Present Simple"),
                    Answer(id: "c-f-3-1", text: "Past Simple"),
                    Answer(id: "c-f-3-2", text: "Past Perfect"),
                    Answer(id: "c-f-3-3", text: "Future Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-4",
                ruleTitle: "Какой Conditional часто используется, если мы хотим предупредить или предостеречь от чего-либо?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-4-0", text: "First conditional"),
                    Answer(id: "c-f-4-1", text: "Second conditional"),
                    Answer(id: "c-f-4-2", text: "Third conditional"),
                    Answer(id: "c-f-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will get into trouble if you continue to hang out with her. – Ты попадешь в неприятности, если продолжишь общаться с ней."),
                    RuleExample(text: "If you drink much coffee, you won’t sleep at night. – Если ты будешь пить много кофе, то не будешь спать ночью."),
                    ].toRealmList()
            ),
            
            ].toRealmList()
    )
    
    let second = Rule(
        id: "c-s",
        ruleDescription: "Second Conditional",
        questions: [
            Question(
                id: "c-s-0",
                ruleTitle: "Second conditional construction",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-0-0", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-s-0-1", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-s-0-1", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to"),
                    Answer(id: "c-s-0-3", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/should/might have have + past participle")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-0-e",
                ruleTitle: "Second Conditional sentences",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-0-e-0", text: "are used to talk about hypothetical or improbable situations in the present or future"),
                    Answer(id: "c-s-0-e-1", text: "are used to talk about a possible present or future situation and its result"),
                    Answer(id: "c-s-0-e-2", text: "are used to talk about a hypothetical situation in the past")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If he were taller, he'd be accepted into the team."),
                    RuleExample(text: "She would still be correcting my grammar if she were alive.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения Second Conditional...",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-1-0", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-s-1-1", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-s-1-2", text: "всегда являются 100% истинной"),
                    Answer(id: "c-s-1-3", text: "выражают воображаемые ситуации, относящиеся к прошлому")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Second Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-2-0", text: "would/could/might + infinitive without to"),
                    Answer(id: "c-s-2-1", text: "Any future form + infinitive without to"),
                    Answer(id: "c-s-2-2", text: "Present Simple"),
                    Answer(id: "c-s-2-3", text: "Past Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-3",
                ruleTitle: "Какая форма используется в If clause конуструкции Second Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-3-0", text: "Past Simple"),
                    Answer(id: "c-s-3-1", text: "Present Simple"),
                    Answer(id: "c-s-3-2", text: "Past Perfect"),
                    Answer(id: "c-s-3-3", text: "Future Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-4",
                ruleTitle: "Какой Conditional используется для того чтобы дать совет",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-4-0", text: "Second conditional"),
                    Answer(id: "c-s-4-1", text: "First conditional"),
                    Answer(id: "c-s-4-2", text: "Third conditional"),
                    Answer(id: "c-s-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I would never do this if I were you. – Я бы никогда этого не сделал, если бы был тобой."),
                    RuleExample(text: "If I were in a tricky situation, I would take this opportunity. – Если бы я попал в сложную ситуацию, я бы воспользовался этой возможностью.")
                    ].toRealmList()
            ),
            ].toRealmList()
    )
    
    let third = Rule(
        id: "c-t",
        ruleDescription: "Third Conditional",
        questions: [
            Question(
                id: "c-t-0",
                ruleTitle: "Third conditional construction",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-0-0", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/might/should/ have + past participle"),
                    Answer(id: "c-t-0-1", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-t-0-2", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-t-0-3", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-0-e",
                ruleTitle: "Third Conditional sentences",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-0-e-0", text: "are used to talk about a hypothetical situation in the past"),
                    Answer(id: "c-t-0-e-1", text: "are used to talk about hypothetical or improbable situations in the present or future"),
                    Answer(id: "c-t-0-e-2", text: "are used to talk about a possible present or future situation and its result"),
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I would have bought it if they’d had it in my size."),
                    RuleExample(text: "If you’d been looking where you were going, you wouldn’t have tripped.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения Third Conditional...",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-1-0", text: "выражают воображаемые ситуации, относящиеся к прошлому"),
                    Answer(id: "c-t-1-1", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-t-1-2", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-t-1-3", text: "всегда являются 100% истинной")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Third Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-2-0", text: "would/could/might + infinitive without to"),
                    Answer(id: "c-s-2-1", text: "Any future form + infinitive without to"),
                    Answer(id: "c-s-2-2", text: "Present Simple"),
                    Answer(id: "c-s-2-3", text: "Past Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-3",
                ruleTitle: "Какая форма используется в If clause конуструкции Third Conditional?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-3-0", text: "Past Perfect"),
                    Answer(id: "c-t-3-1", text: "Past Simple"),
                    Answer(id: "c-t-3-2", text: "Present Simple"),
                    Answer(id: "c-t-3-3", text: "Future Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-4",
                ruleTitle: "Какой Conditional используется когда мы критикуем какие-то действия, которые произошли в прошлом и которые мы не можем уже изменить?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-4-0", text: "Third conditional"),
                    Answer(id: "c-t-4-1", text: "Second conditional"),
                    Answer(id: "c-t-4-2", text: "First conditional"),
                    Answer(id: "c-t-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you had listened carefully, you wouldn’t have made so many mistakes. – Если бы ты внимательно слушал, ты бы не допустил так много ошибок."),
                    RuleExample(text: "If you hadn’t left your car opened, it wouldn’t have been stolen. – Если бы ты не оставил машину открытой, ее бы не угнали.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-5",
                ruleTitle: "Какой Conditional используется когда хотим сообщить о хороших событиях, которые произошли в прошлом и положительно повлияли на наше настоящее.?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-4-0", text: "Third conditional"),
                    Answer(id: "c-t-4-1", text: "Second conditional"),
                    Answer(id: "c-t-4-2", text: "First conditional"),
                    Answer(id: "c-t-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "He wouldn’t have made this discovery if he hadn’t done precise calculations. – Он не совершил бы это открытие, если бы не сделал очень точные расчеты."),
                    RuleExample(text: "If I hadn’t taken the wrong way, I wouldn’t have met you. – Если бы я не пошел по неправильной дороге, я бы не встретил тебя.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-6",
                ruleTitle: "Какой Conditional используется в случае когда-то в прошлом что-то произошло, мы об этом сожалеем, но изменить событие уже не можем?",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-4-0", text: "Third conditional"),
                    Answer(id: "c-t-4-1", text: "Second conditional"),
                    Answer(id: "c-t-4-2", text: "First conditional"),
                    Answer(id: "c-t-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "He wouldn’t have made this discovery if he hadn’t done precise calculations. – Он не совершил бы это открытие, если бы не сделал очень точные расчеты."),
                    RuleExample(text: "If I hadn’t taken the wrong way, I wouldn’t have met you. – Если бы я не пошел по неправильной дороге, я бы не встретил тебя.")
                    ].toRealmList()
            ),
            
            ].toRealmList()
    )
    
    return [zero, first, second, third]
    
}

